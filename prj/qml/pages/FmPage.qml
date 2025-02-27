import QtQuick 2.0

import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    objectName: "fmPage"
    allowedOrientations: Orientation.All

    Column {
        id: fmColumn
        width: parent.width
        spacing: Theme.paddingLarge

        Button {
            id: europaPlusBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "1.EuropaPlus"
            onClicked: playEuropaPlus()
        }

        Button {
            id: jokeBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "2.Юмор FM"
            onClicked: playJokeFM()
        }

        Button {
            id: sybirBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "3.Сибирь FM"
            onClicked: playSybirFM()
        }


        Label {
            id: heading
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: Theme.fontSizeExtraLarge
        }

        Label {
            id: metaDataTitle
            anchors.horizontalCenter: parent.horizontalCenter
        }

        IconButton {
            objectName: "stopButton"
            icon.source: "image://theme/icon-m-about"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: onStopClicked()
        }
    }

    MediaPlayer {
        id: player
        metaData.onMetaDataChanged: metaDataTitle.text = player.metaData.title || "Нет заголовка"
    }

//-----------------------------------------------------------------------------
    function playEuropaPlus(){
        heading.text = europaPlusBtn.text
        metaDataTitle.text = "Хит40"
        player.stop()
        player.source = "http://eptop128server.streamr.ru:8033/eptop128"
        player.play()
    }
//-----------------------------------------------------------------------------
    function playJokeFM(){
        heading.text = jokeBtn.text
        metaDataTitle.text = "Сайт"
        player.stop()
        player.source = "http://srv02.gpmradio.ru:8000/stream/air/aac/64/102"
        player.play()
    }

//-----------------------------------------------------------------------------
    function playSybirFM(){
        heading.text = sybirBtn.text
        metaDataTitle.text = "Радио-сибирь Омск"
        player.stop()
        player.source = "https://stream.radiosibir.ru:8093/rsomskweb?rn=594"
        player.play()
    }

//-----------------------------------------------------------------------------
    function onStopClicked(){
        player.stop()
        heading.text = "Stopped"
        metaDataTitle.text = ""
    }
}
