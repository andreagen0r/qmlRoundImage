import QtQuick
import QtQuick.Controls

Item {
    property alias source: image.source
    property alias edge: effect.edge

    Image { id: image; visible: false }

    ShaderEffect {
        id: effect
        property variant src: image
        property double edge: 1.0

        anchors.fill: parent
        vertexShader: "qrc:/shaders/roundImage.vert.qsb"
        fragmentShader: "qrc:/shaders/roundImage.frag.qsb"
    }
}

