import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
  id: root

  width: 640
  height: 700
  visible: true
  title: qsTr("Shader")

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 30
    spacing: 10

    Item {
      Layout.fillWidth: true
      Layout.fillHeight: true

      RoundImage {
        readonly property real size: Math.min(parent.width, parent.height)
        anchors.centerIn: parent
        width: size
        height: size
        source: Qt.resolvedUrl( "/RoundImage/mahdi-bafande-qgJ1rt7TeeY-unsplash.jpg")
        radius: sRadius.value
        topLeftRadius: sTopLeft.value
        bottomLeftRadius: sBottomLeft.value
        topRightRadius: sTopRight.value
        bottomRightRadius: sBottomRight.value
        softness: sSoftness.value
      }
    }

    RowLayout {
      Layout.fillWidth: true
      Label { text: qsTr("Radius:"); Layout.minimumWidth: 70 }
      Slider { id: sRadius; value: 0.5; Layout.fillWidth: true }
    }

    RowLayout {
      Layout.fillWidth: true
      Layout.fillHeight: true

      ColumnLayout {
        Layout.fillWidth: true

        RowLayout {
          Layout.fillWidth: true
          Label { text: qsTr("Radius TL:"); Layout.minimumWidth: 70 }
          Slider { id: sTopLeft; Layout.fillWidth: true }
        }

        RowLayout {
          Layout.fillWidth: true
          Label { text: qsTr("Radius BL:"); Layout.minimumWidth: 70 }
          Slider { id: sBottomLeft; Layout.fillWidth: true }
        }
      }

      ColumnLayout {
        Layout.fillWidth: true
        RowLayout {
          Layout.fillWidth: true
          Label { text: qsTr("Radius TR:") }
          Slider { id: sTopRight; Layout.fillWidth: true }
        }

        RowLayout {
          Layout.fillWidth: true
          Label { text: qsTr("Radius BR:") }
          Slider { id: sBottomRight; Layout.fillWidth: true }
        }
      }
    }

    RowLayout {
      Layout.fillWidth: true
      Label { text: qsTr("softness:") ; Layout.minimumWidth: 70 }
      Slider { id: sSoftness; Layout.fillWidth: true }
    }
  }

  Label {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.rightMargin: 30
    anchors.bottomMargin: 10
    font.pointSize: 8
    color: "silver"
    text: qsTr("Photo by Mahdi Bafande on Unsplash")
  }
}
