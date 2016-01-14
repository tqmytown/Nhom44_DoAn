import QtQuick 2.0
import VPlay 2.0

// Background chua Gird ( bang nhau)
Rectangle{
    id: backGround
    width : gridWidth
    height : width
    color : "#81c2be"    
    radius: 5

    Grid{
        id: myGrid
        anchors.centerIn: parent
        rows: gridSizeGame
        Repeater{
            id: cells
            model: gridSizeGameSquared
            Item{
                width : gridWidth/gridSizeGame
                height: width
                Rectangle{
                    anchors.centerIn: parent
                    width: parent.width-2
                    height: width
                    color: "#e6e6e1"
                    radius: 100
                    border.color: "#188b48"
                    border.width : 2

                }
            }
        }
    }
}


