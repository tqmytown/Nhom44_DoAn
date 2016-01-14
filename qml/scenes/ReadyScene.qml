import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
  id: readyScene

  signal levelPressed(string selectedLevel)


  // background
  Rectangle {
    anchors.fill: parent.gameWindowAnchorItem
    color: "#eee9a2"
    border.color: "#fb4a4a"
    border.width: 2
    radius: 5
    Text{
        color: "#09a80f"
        text: "Click image to go !!! "
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
    anchors.right: readyScene.gameWindowAnchorItem.right
    anchors.rightMargin: 10
    anchors.top: readyScene.gameWindowAnchorItem.top
    anchors.topMargin: 10
    onClicked: backButtonPressed()
  }

  Text {
      anchors.top: parent.top
      anchors.topMargin: 50
      anchors.horizontalCenter: parent.horizontalCenter
    text: "      How to play 2048 ?
             Swipe to move all Tiles,
         when two Tiles with the same number touch
             they Merge intro one.
         Join the numbers and get to the 2048 Tile"

    font.family: "Kozuka Mincho Pr6N H"
    font.italic: true
    font.pointSize: 11
    verticalAlignment: Text.AlignVCenter
    style: Text.Sunken
    horizontalAlignment: Text.AlignHCenter
    color: "#ec3f2f"
    font.bold: true
  }

  // levels to be selected
  Column {
     anchors.centerIn: parent
     spacing: 1
     Row{
         spacing: 5
         AnimatedSpriteVPlay {
           frameWidth: 32
           frameHeight: 32
           frameCount: 4
           startFrameColumn: 1
           frameRate: 20
           source: "../../assets/squafurY.png"
         }
         AnimatedSpriteVPlay {
           frameWidth: 32
           frameHeight: 32
           frameCount: 4
           startFrameColumn: 1
           frameRate: 20
           source: "../../assets/squafurY.png"
         }
     }  //row

    MenuButton {
        id: vitri
        width: 1
        height: 1

      Image {
          id: goplay
          anchors.centerIn: vitri.Center
          source: "../../assets/goplay.png"
          RotationAnimation on rotation {
              loops: Animation.Infinite
              from: 0
              to: 360
          }

                  MouseArea {
                      anchors.fill: parent
                      onClicked: {
                        levelPressed("Level1.qml")
                     }

                }
           }
     }


  }

  Item {
      anchors.left: readyScene.gameWindowAnchorItem.left
      anchors.leftMargin: 10
      anchors.bottom: readyScene.gameWindowAnchorItem.bottom
      anchors.bottomMargin: 50

      Timer {
          interval: 500; running: true; repeat: true
          onTriggered: time.text = Date().toString()
      }

      Text {
          id: time
          color: "#ec1616";font.family: "Times New Roman" ;
          styleColor: "#000000"; style: Text.Outline;font.pointSize: 15
      }
  }

}
