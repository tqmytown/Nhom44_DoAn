import QtQuick 2.2
import VPlay 2.0

EntityBase{

  id: tile
  entityType: "Tile"

  width: gridWidth / gridSizeGame
  height: width

  property int tileIndex
  property int tileValue
  property color tileColor
  property color tileTextColor: "blue"
  property string tileText

  property int tileFontSize: width/3


  property int animationDuration: system.desktopPlatform ? 500 : 250

  // tileColor corresponds to the tileValue
  property var bgColors: ["#000000", "#d8f5ec", "#f3eaa0", "#f3bb59", "#f37e35", "#f32323", "#8d0f0f", "#e6ec35 ", "#d5d20e", "#a8d535", "#8de617", "#16f3e5"]

  // tile rectangle
  Rectangle {
    id: innerRect
    anchors.centerIn: parent // center this object in the invisible "EntityBase"
    width: parent.width-2 // -2 is the width offset, set it to 0 is no offset is needed
    height: width
    // square so height=width
    radius: 100// radius of tile corners
    color: bgColors[tileValue]
    border.width: 3
    border.color: "#4aec34"

    // tile text
    Text {
      id: innerRectText
      anchors.centerIn: parent
      color: tileTextColor
      font.pixelSize: tileFontSize
      text: Math.pow(2, tileValue)
    }
  }

  // startup position calculation
  Component.onCompleted: {
    x = (width) * (tileIndex % gridSizeGame)
    y = (height) * Math.floor(tileIndex/gridSizeGame)
    tileValue = Math.random() < 0.9 ? 1 : 2 // a new tile has 10% = 4 and 90% = 2
    showTileAnim.start() // new tile animation trigger
  }


  function moveTile(newTileIndex) {
    tileIndex = newTileIndex
    moveTileAnim.targetPoint.x = ((width) * (tileIndex % gridSizeGame))
    moveTileAnim.targetPoint.y = ((height) * Math.floor(tileIndex/gridSizeGame))
    moveTileAnim.start()
  }

  function destroyTile() { // trigger tile death animation
    deathAnimation.start()
  }

  // in a parallel animation, animations which are inside will run at the same time
  ParallelAnimation {
    id: showTileAnim


    NumberAnimation {
      target: innerRect
      property: "opacity"
      from: 0.0
      to: 1.0
      duration: animationDuration
    }

    // ScaleAnimator used for scaling
    ScaleAnimator {
      target: innerRect
      from: 0
      to: 1
      duration: animationDuration
      easing.type: Easing.OutQuad
    }
  }

  // movement animation
   ParallelAnimation {
    id: moveTileAnim
    property point targetPoint: Qt.point(0,0)
    NumberAnimation {
      target: tile
      property: "x"
      duration: animationDuration/3
      to: moveTileAnim.targetPoint.x
    }
    NumberAnimation {
      target: tile
      property: "y"
      duration: animationDuration/3
      to: moveTileAnim.targetPoint.y
    }
  }

  SequentialAnimation {
    id: deathAnimation
    NumberAnimation {
      target: innerRect
      property: "opacity"
      from: 1
      to: 0
      duration: animationDuration/4
    }
    ScriptAction {
      script: removeEntity() // removesEntity from the game
    }
  }
}
