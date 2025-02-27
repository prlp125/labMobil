import QtQuick 2.0

import QtSensors 5.2
import Sailfish.Silica 1.0

//-----------------------------------------------------------------------------
Page {
    objectName: "CompasPage"
    allowedOrientations: Orientation.All

    Column {
        id: compasColumn
        width: parent.width
        spacing: Theme.paddingLarge

        Text {
            id: headingText
            text: "Угол: 0.00 град."
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
        }

        Text {
            id: directionText
            text: "Направление: Север"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
        }

        Compass {
            id: compass
            active: true
        }

        Timer {
            id: updateTimer
            interval: 1000 // Обновление каждую секунду
            running: true
            repeat: true
            onTriggered: {
                var heading = compass.heading; // Получение текущего угла
                headingText.text = "Угол: " + Math.round(heading * 100) / 100 + " град";
                directionText.text = "Направление: " + getDirection(heading);
            }
        }
    }

//-----------------------------------------------------------------------------
    // Определяет направление
    function getDirection(heading) {
        if (heading >= 337.5 || heading < 22.5) return "Север";
        else if (heading >= 22.5 && heading < 67.5) return "Восток";
        else if (heading >= 67.5 && heading < 112.5) return "Юг";
        else if (heading >= 112.5 && heading < 157.5) return "Запад";
        else if (heading >= 157.5 && heading < 202.5) return "Юг";
        else if (heading >= 202.5 && heading < 247.5) return "Запад";
        else if (heading >= 247.5 && heading < 292.5) return "Север";
        else return "Север";
    }
}
