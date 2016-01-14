import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
  id: window
  width: 360
  height: 480

  EntityManager {
    id: entityManager
  }


  BackgroundMusic{
      id: bgmusic
      source: "../assets/BackgroundMusic.wav"
  }

  SoundEffectVPlay {
      id:movemusic
      source:"../assets/PlayMusic.wav"
  }

  // menu scene
  MenuScene {
    id: menuScene
    // lang nghe su kien click vao button
    onSelectLevelPressed: window.state = "ready"
    onCreditsPressed: window.state = "intro"

    //su kien thoat tro choi
    onBackButtonPressed: {
      nativeUtils.displayMessageBox(qsTr("Really quit the 2048?"), "", 2);
    }
    // hien thi thong bao
    Connections {
      target: nativeUtils
      onMessageBoxFinished: {
        if(accepted && window.activeScene === menuScene)
          Qt.quit()
      }
    }
  }

  ReadyScene {
    id: readyScene
    onLevelPressed: {
      gameScene.setLevel(selectedLevel)
      window.state = "game"

    }
    onBackButtonPressed: window.state = "menu"
  }

  // Intro  scene
  CreditsScene {
    id: creditsScene
    onBackButtonPressed: window.state = "menu"
  }


  GameScene {
    id: gameScene
    onBackButtonPressed: {

        window.state = "ready"
        bgmusic.play()
    }
  }


  // menuScene is our first scene, so set the state to menu initially
  state: "menu"
  activeScene: menuScene

  // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
  states: [
    State {
      name: "menu"
      PropertyChanges {target: menuScene; opacity: 1}
      PropertyChanges {target: window; activeScene: menuScene}
    },
    State {
      name: "ready"
      PropertyChanges {target: readyScene; opacity: 1}
      PropertyChanges {target: window; activeScene: readyScene}
    },
    State {
      name: "intro"
      PropertyChanges {target: creditsScene; opacity: 1}
      PropertyChanges {target: window; activeScene: creditsScene}
    },
    State {
      name: "game"
      PropertyChanges {target: gameScene; opacity: 1}
      PropertyChanges {target: window; activeScene: gameScene}
    }
  ]

}
