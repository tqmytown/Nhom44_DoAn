import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
  id:creditsScene

  // background
  Rectangle {
    anchors.fill: parent.gameWindowAnchorItem
    color: "#1ec01b"
    border.color: "#fb4a4a"
    border.width: 2
    radius: 5
    Text{
        color: "#09a80f"
        text: "Intro my team !!! "
        font.family: "Minion Pro Cond"
        font.bold: true
        font.pointSize: 20
        style: Text.Outline
        horizontalAlignment: Text.AlignHCenter
    }

    // The wooden blanks scroll vertical with 10px per second
    ParallaxScrollingBackground {
      anchors.centerIn: parent
      movementVelocity: Qt.point(0,20)
      ratio: Qt.point(1.0,1.0)
      sourceImage: "../../assets/background-wood2.png"
    }
  }


  // back button to leave scene
  MenuButton {
    text: "Back"
    // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
    anchors.right: creditsScene.gameWindowAnchorItem.right
    anchors.rightMargin: 10
    anchors.top: creditsScene.gameWindowAnchorItem.top
    anchors.topMargin: 10
    onClicked: backButtonPressed()
  }


  Image {

      id: quanghagiasang
      source: "../../assets/quanghagiasang.png"
      scale: 0.3
      anchors.bottom: creditsScene.gameWindowAnchorItem.bottom
      anchors.bottomMargin : 10
      anchors.right: creditsScene.gameWindowAnchorItem.right
      anchors.rightMargin: -130

  }


  // credits

  Text {
    text: "        SE114.G13
     Nhap mon phan mem & he thong nhung
                   Nhom 44:
               13520222 - Bui Quang Ha
               13520700 - Tran Gia Sang"

    font.family: "Kozuka Mincho Pr6N H"
    font.italic: true
    verticalAlignment: Text.AlignVCenter
    font.pointSize: 12
    style: Text.Outline
    horizontalAlignment: Text.AlignHCenter
    color: "#e6da79"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: creditsScene.gameWindowAnchorItem.top
    anchors.topMargin: 30

  }
}
