import QtQuick
import QtQuick.Controls.Basic

Control {
  implicitWidth: 200
  implicitHeight: 200

  property alias source: image.source
  property alias radius: effect.radius
  property alias topLeftRadius: effect.topLeftRadius
  property alias topRightRadius: effect.topRightRadius
  property alias bottomLeftRadius: effect.bottomLeftRadius
  property alias bottomRightRadius: effect.bottomRightRadius
  property alias softness: effect.softness

  Image { id: image; visible: false }

  ShaderEffect {
    id: effect
    property Image src: image
    property real radius: 0
    property real topLeftRadius: 0
    property real topRightRadius: 0
    property real bottomLeftRadius: 0
    property real bottomRightRadius: 0
    property real softness: 0

    anchors.fill: parent
    vertexShader: "qrc:/shaders/roundImage.vert.qsb"
    fragmentShader: "qrc:/shaders/roundImage.frag.qsb"
  }
}
