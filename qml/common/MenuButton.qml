import QtQuick 2.0

Rectangle {
  id: button

  width: buttonText.width+ paddingHorizontal*2
  height: buttonText.height+ paddingVertical*2

  color: "#27e841"
  border.color: "#fb4a4a"
  border.width: 3

  radius: 100

  property int paddingHorizontal: 10

  property int paddingVertical: 5

  property alias text: buttonText.text

  signal clicked

  Text {
    id: buttonText
    anchors.centerIn: parent
    font.pixelSize: 18
    color: "#ebf133"
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    onClicked: button.clicked()
    onPressed: button.opacity = 0.5
    onReleased: button.opacity = 1
  }
}
