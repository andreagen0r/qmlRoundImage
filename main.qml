import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 640
    height: 580
    visible: true
    title: qsTr("Photo by Mahdi Bafande on Unsplash")

    Rectangle {
        anchors.fill: parent
        color: "lightgray"

        Label {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 10
            text: "Photo by Mahdi Bafande on Unsplash"
        }

        Column {
            anchors.centerIn: parent
            spacing: 10

            RoundImage {
                width: 400
                height: width
                source: "qrc:/image/mahdi-bafande-qgJ1rt7TeeY-unsplash.jpg"
                edge: slider.value
            }

            Slider {
                id: slider
                width: parent.width
                from: 0
                to: 1
                value: 1
            }
        }
    }
}
