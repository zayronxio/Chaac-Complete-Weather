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
    property int fonssizes: Plasmoid.configuration.sizeFontConfig

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
            width: heightroot < 24 ? 22 : 24
            height: width
            source: weatherData.iconWeatherCurrent
            anchors.verticalCenter: parent.verticalCenter
            roundToIconSize: false
        }
        Column {
            id: columntemandweathertext
            width: shortweathertext.implicitWidth < temOfCo.width ? temOfCo.width : shortweathertext.implicitWidth
            height: temOfCo.implicitHeight + shortweathertext.implicitHeight
            anchors.verticalCenter: parent.verticalCenter
            Row {
                id: temOfCo
                width: textGrados.width + subtextGrados.width
                height: textGrados.implicitHeight
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
                height: shortweathertext.implicitHeight
                width: shortweathertext.implicitWidth
                z: 2
                Label {
                    id: shortweathertext
                    text: weatherData.weatherShottext
                    font.pixelSize: fonssizes
                    font.bold: true
                    visible: true
                    verticalAlignment: Text.AlignvCenter
                }
            }

        }


    }


}

