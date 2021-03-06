import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import EventAppData 1.0
import "qrc:///shared/dataList.js" as DataListJS

// List view for showing items added manually in EvantApp.
// Crated dynamically from EvantAppPage.qml refershLists
ListView {
    id: dataListImage
    property int temp: 32

    property EAItemList eaLVItemList: undefined
    property bool isExpanded: false
   // property alias dataImageModel: dataImageModel

    onEaLVItemListChanged: {
        console.log("dataListImage eaItemList chnaged");
        resetDataImageListModel(dataImageModel
                           , eaLVItemList.items
                           , eaLVItemList.getIndex())
    }

    Connections {
        target: eaLVItemList
        onEaItemListChanged: {
            resetDataImageListModel(dataImageModel
                               , eaLVItemList.items
                               , eaLVItemList.getIndex())
        }
    }

    model: ListModel { id: dataImageModel }

    delegate:    DLImageDelegate { id: thisDataDelgate
        onStateChanged: {
            dataListImage.isExpanded = state === "Details";
            console.log("DLImageDelegate", index);
            //popQuestionList(eaLVItemList.items[index]);
            //popMapInfo(eaLVItemList.items[index].mapInfo);
        }

        Connections {
            target: eaLVItemList.items[index]
            onEaQuestionsChanged: {
                console.log("DLImageDelegate", index);
                //popQuestionList(eaLVItemList.items[index]);
            }
        }

        Connections {
            target: dataListImage
            onIsExpandedChanged: {
                if (isExpanded === false ) {
                    //eaLVItemList.items[index].saveAnswers();
                    eaLVItemList.saveAnswers(index);
                }
            }
        }

        Connections {
            target: eaContainer
            onEaConstructionChanged: {
                setIDisplayParameters();
            }
        }

        Connections {
            target: eaLVItemList
            onEaItemsChnged: {
                  console.log("Page onEaItemsChnged");
                  resetDataImageLM()
                  console.log("Page onEaItemsChnged");
            }
        }
        Component.onCompleted: {
            setIDisplayParameters();
        }
    }

    function resetDataImageLM() {
        resetDataImageListModel(dataImageModel
                           , eaLVItemList.items
                           , eaLVItemList.getIndex());
    }

    function resetDataImageListModel(dataImageModel, items, index) {
        dataImageModel.clear();
        console.log("items.length", items.length);
        var ilen = items.length;
        for ( var i=0 ; i<items.length ; i++ )
        {
            var whatis = items[i];
            var picturePath = "image://list_" + index.toString();
            picturePath += "_" + eaContainer.imageVersion;
            picturePath += "/" +i.toString();
            var dic = {
                "itemType" : items[i].itemType
                ,"title" : items[i].title
                ,"displayText" : items[i].displayText
                ,"showUrl" : items[i].url
                ,"picture" : picturePath
                ,"itemIndex" : i
            }
            console.log("resetDataImageListModel i ", i);
            console.log("picturePath", picturePath);
            dataImageModel.append(dic);
        }
    }

}
















