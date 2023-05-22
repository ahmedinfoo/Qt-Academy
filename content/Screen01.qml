/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import ToDoDemo
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#919999"
    property bool isDialogOpen: false


    Button {
        id: addToDoButton
        y: 404
        text: qsTr("ADD TODO ")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10

        Connections {
            target: addToDoButton
            onClicked: rectangle.isDialogOpen=!rectangle.isDialogOpen
        }
    }

    Rectangle {
        id: addToDoDialog
        x: 10
        y: 536
        width: 380
        height: 200
        visible: rectangle.isDialogOpen
        color: "#d6d7d7"
        radius: 30

        TextField {
            id: toDoTextInput
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10
            placeholderText: qsTr("Add Todo")
        }

        RowLayout {
            y: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 40
            anchors.bottomMargin: 10
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            Button {
                id: cancelButton
                text: qsTr("Cancel")
                Layout.fillWidth: true

                Connections {
                    target: cancelButton
                    onClicked: rectangle.isDialogOpen=false
                }

                Connections {
                    target: cancelButton
                    onClicked: toDoTextInput.clear()
                }
            }

            Button {
                id: addButton
                text: qsTr("ADD")
                Layout.fillWidth: true

                Connections {
                    target: addButton
                    onClicked: rectangle.isDialogOpen=false
                }

                Connections {
                    target: addButton
                    onClicked: myListModel.append(myListModel.createListElement())
                }
            }
        }
    }

    Label {
        id: label
        text: qsTr("To Do")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 9
        anchors.leftMargin: 10
        font.pointSize: 26
        anchors.topMargin: 10
    }

    Column {
        id: column
        anchors.fill: parent
        spacing: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 100
        anchors.topMargin: 100

        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel{
                id: myListModel
                ListElement{
                    name: "My To Do"
                }
                function createListElement(){
                return {"name": toDoTextInput.text}
                }
            }

            Rectangle {
                id: toDoItem
                x: 0
                y: -35
                height: 60
                color: "#d6d7d7"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.leftMargin: 10

                CheckBox {
                    id: checkBox
                    width: 153
                    text: name
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 22
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }
            }
        }
    }
}
