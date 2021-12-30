import QtQuick 2.0
import "./functions.js" as Func

Item {
    id: itemDelegate
    width: grid.cellWidth
    height: grid.cellHeight
    Rectangle{
        id: componentRect
        width: grid.cellWidth * 0.93
        height: width
        border.color: "black"
        gradient: Gradient {
            GradientStop { position: 0.0; color: index === myGrid.listModel.get(index).number - 1 ? Qt.lighter("steelblue") : Qt.lighter("cyan")}
            GradientStop { position: 1.0; color: index === myGrid.listModel.get(index).number - 1 ? Qt.darker("steelblue") : Qt.darker("darkcyan") }
        }
        radius: 10
        anchors.centerIn: parent
        visible: number
        Text {
            anchors.centerIn: parent
            text: number
            font.bold: true
            font.pixelSize: parent.width / 5
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var zero_index = Func.find_zero(myGrid.listModel);
                if(Func.check_zero(index, zero_index)){
                    Func.swap(index, zero_index,myGrid.listModel);
                }
                if(Func.check_solved(myGrid.listModel)){
                    myPopup.open()
                }
                else{
                console.log("Not a winning combination")
                }
                quit.focus = true
            }
        }
    }
}
