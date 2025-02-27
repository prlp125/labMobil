import QtQuick 2.0

//import Nemo.Notifications 1.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    /*Component.onCompleted: {
        showNotification();
    }*/

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Template")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Column {
        id: mainColumn
        width: parent.width
        height: parent.height
        spacing: Theme.paddingLarge

        Button {
            id: fmBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "1.Радио"
            onClicked: pageStack.push(Qt.resolvedUrl("FmPage.qml"))
        }

        Button {
            id: compasBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "2.Компас"
            onClicked: pageStack.push(Qt.resolvedUrl("CompasPage.qml"))
        }
    }

//-----------------------------------------------------------------------------
   /* // Функция для отображения уведомления
    function showNotification() {
        var notification = new Nemo.Notification();
        notification.title = qsTr("Уведомление");
        notification.body = qsTr("Вы открыли приложение!");
        notification.icon = "image://theme/icon-m-notification";
        notification.show();
    }*/

}
