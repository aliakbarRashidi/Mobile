import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import EventAppData 1.0
import "common.js" as ComonJS

ListView {  
    id: dataList
    width: parent.width
    height: parent.height
    property EAItemList eaItemList: undefined
    onEaItemListChanged: {
        console.log("dataList eaItemList chnaged");
        ComonJS.resetDataListModel(dataModel
                                   , JSON.parse(eaItemList.dataList))
    }

    property  alias dataModel: dataModel
    model: ListModel {
        id: dataModel
    }
    delegate: DataListDelegate {
    }
}
