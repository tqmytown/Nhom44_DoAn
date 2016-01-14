import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
  id: menuScene

  // signal indicating that the selectLevelScene should be displayed
  signal selectLevelPressed
  // signal indicating that the creditsScene should be displayed
  signal creditsPressed

  property int velocityX: 20

  Text{
      font.pixelSize: 30
      color: "#ec3f2f"
      text: "13520222 & 13520700"
      font.family: "Adobe Caslon Pro Bold"
      font.bold: true
      horizontalAlignment: Text.AlignHCenter
      style: Text.Outline
  }

  // The wooden blanks scroll vertical with 10px per second
  ParallaxScrollingBackground {
    anchors.centerIn: parent
    movementVelocity: Qt.point(0,40)
    ratio: Qt.point(0.1,1.0)
    sourceImage: "../../assets/background-wood2.png"
  }

  // The mountain background scrolls with a ratio of 0.7 (only half of the velocity)
  ParallaxScrollingBackground {
    anchors.centerIn: parent
    movementVelocity: Qt.point(menuScene.velocityX,0)
    ratio: Qt.point(0.7,1.0)
    sourceImage: "../../assets/background-mountains.png"
  }

  // The hill background scrolls with a ratio of 1.0
  ParallaxScrollingBackground {
    anchors.centerIn: parent
    movementVelocity: Qt.point(menuScene.velocityX,0)
    ratio: Qt.point(1.0,1.0)
    sourceImage: "../../assets/background-hills.png"
    sourceImage2: "../../assets/background-hills2.png"
  }

  // The lawn background scrolls with a ratio of 1.3 (even faster than the velocity)
  ParallaxScrollingBackground {
    anchors.centerIn: parent
    movementVelocity: Qt.point(menuScene.velocityX,0)
    ratio: Qt.point(1.3,1.0)
    sourceImage: "../../assets/background-lawn.png"
  }

  // background
   /*  Rectangle {
          anchors.fill: parent.gameWindowAnchorItem
          color: "#57c3d3"
          border.color: "#fb4a4a"
          border.width: 2
          radius: 5
     }
     */

  /*
  // the "logo"
    Text {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 20
    font.pixelSize: 30
    color: "#ec3f2f"
    text: "13520222 & 13520700"
    font.family: "Adobe Caslon Pro Bold"
    font.bold: true
    horizontalAlignment: Text.AlignHCenter
    style: Text.Outline
  }
    */



  Text {
    anchors.horizontalCenter: parent.horizontalCenter
    y: 50
    font.pixelSize: 30
    color: "#ec3f2f"
    text: "Game 2048"
    font.family: "Adobe Caslon Pro Bold"
    font.bold: true
    horizontalAlignment: Text.AlignHCenter
    style: Text.Outline
  }

  Text {

      anchors.left: menuScene.gameWindowAnchorItem.left
      anchors.leftMargin: 10
      anchors.bottom: menuScene.gameWindowAnchorItem.bottom
      anchors.bottomMargin: 10
    font.pixelSize: 20
    color: "#ec3f2f"
    text: "GVHD: Ths.Phan Nguyet Minh"
    font.family: "Adobe Caslon Pro Bold"
    font.bold: true
    style: Text.Outline

  }

  // menu

  Column {

    anchors.centerIn: parent
    spacing: 12

    MenuButton {
      height: 40
      width: 100
      text: "Play"
      color: "green"
      onClicked: selectLevelPressed()
    }


    MenuButton {
        height: 40
        width: 100
      text: "Intro"
      color: "green"
      onClicked: creditsPressed()
    }

    MenuButton{
        text: "Quit"
        height: 40
        width: 100
      color: "green"
      onClicked: backButtonPressed()
    }
    MenuButton{
        height: 1
        width : 0

    }

    Row {
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
        mirrorX: true

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

    }// Row
    Row {
      spacing: 5

      AnimatedSpriteVPlay {
        mirrorY: true

        frameWidth: 32
        frameHeight: 32
        frameCount: 4
        startFrameColumn: 1
        frameRate: 20
        source: "../../assets/squafurY.png"
      }
      AnimatedSpriteVPlay {
        mirrorX: true
        mirrorY: true

        frameWidth: 32
        frameHeight: 32
        frameCount: 4
        startFrameColumn: 1
        frameRate: 20
        source: "../../assets/squafurY.png"
      }
      AnimatedSpriteVPlay {
        mirrorY: true
        frameWidth: 32
        frameHeight: 32
        frameCount: 4
        startFrameColumn: 1
        frameRate: 20
        source: "../../assets/squafurY.png"
      }

    }// Row

  } // Column

}
