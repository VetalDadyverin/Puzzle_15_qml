import QtQuick 2.0
import "./functions.js" as Func


Rectangle{
    property alias grid: _grid
    property alias listModel: _listModel
    border.color: "black"
    color: "grey"
    width: root.width < root.height ? root.width / 1.4 : root.height / 1.4
    height: width
    radius: 10
    GridView{
        id: _grid
        width: parent.width
        height: parent.height
        anchors.fill: parent
        cellWidth: parent.width / 4
        cellHeight: cellWidth
        interactive: false
        model: listModel
        delegate: MyComponent{}
        move: trans
        displaced: trans
        Component.onCompleted: {
            Func.fill_model(model, 16)
            _listModel.move(0,12,1)
//            Func.shuffle(listModel)
        }
        Transition {
            id: trans
            NumberAnimation{
                properties: "x, y"
                duration: 400
            }

        }
    }
    ListModel {
        id: _listModel
    }
}
