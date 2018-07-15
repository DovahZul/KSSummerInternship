import QtQuick 2.0
import QtQuick.Controls 2.2

    TextField
    {
        id: myField
        state: "normal"

        states: [

            State {
                when: area.containsMouse
                name: "error"
                PropertyChanges {
                    target: myField
                    color: "#b31515"
                    //borderColor: "red"
                }
            },
            State {
                name: "normal"
                when: area.containsMouse == false
                PropertyChanges {
                    target: myField
                    color: "#c5dffa"
                  //  borderColor: "silver"
                }
            }


        ]

        MouseArea
        {
            id: area

            hoverEnabled: true
            anchors.fill: parent
        }

    }
