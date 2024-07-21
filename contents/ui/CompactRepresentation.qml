import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasma5support as Plasma5Support
import "components" as Components

RowLayout {
    id: iconAndTem
    Layout.minimumWidth: initialv.impliitWidth + icon.width*.5
    Layout.minimumHeight: heightroot
    spacing: icon.height/4
    property string undefanchors: activeweathershottext ? undefined : parent.verticalCenter
    property int heightroot: 50
    property bool activeweathershottext: heightroot > 37 ? true : false
    property int fonssizes:  sizeFontConfg === "0" ? activeweathershottext ? heightroot/1.7 : heightroot*1 : sizeFontConfg === "1" ? activeweathershottext ? heightroot/2.2 : heightroot/1.4 : activeweathershottext ? heightroot/3.8 : heightroot/2.2

    Components.WeatherData {
        id: weatherData
    }
    MouseArea {
        id: compactMouseArea
        anchors.fill: parent

        hoverEnabled: true

        onClicked: root.expanded = !root.expanded
    }
    Row {
        id: initial
        width: icon.width + columntemandweathertext.width + icon.width*.3
        height: heightroot
        spacing: icon.width/5
        Layout.alignment: Qt.AlignVCenter

        Kirigami.Icon {
            id: icon
            width: heightroot
            height: width
            source: weatherData.iconWeatherCurrent
            roundToIconSize: false
        }
        Column {
            id: columntemandweathertext
            width: shortweathertext.implicitWidth < temOfCo.width ? temOfCo.width : shortweathertext.implicitWidth
            height: heightroot
            Row {
                id: temOfCo
                width: textGrados.width + subtextGrados.width
                height: heightroot/2
                anchors.verticalCenter: undefanchors

                Label {
                    id: textGrados
                    text: weatherData.temperaturaActual
                    font.bold: boldfonts
                    font.pixelSize: fonssizes
                    color: PlasmaCore.Theme.textColor
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    id: subtextGrados
                    text: (root.temperatureUnit === "0") ? " °C" : " °F"
                    font.bold: boldfonts
                    font.pixelSize: fonssizes
                    color: PlasmaCore.Theme.textColor
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Item {
                height: heightroot/2
                width: shortweathertext.implicitWidth
                z: 2
                Label {
                    id: shortweathertext
                    text: weatherData.weatherShottext
                    font.pixelSize: heightroot*.38
                    visible: activeweathershottext ? true : false
                    verticalAlignment: Text.AlignvCenter
                }
            }

        }


    }


}

