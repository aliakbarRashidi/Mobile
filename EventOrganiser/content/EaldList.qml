import QtQuick 2.0

EaldListForm {
    function popItemList (eventList) {
        console.log("Start popItemList");
        itemsModel.clear();
        var itemCount = eventList.items.length;
        for ( var i=0 ; i<itemCount ; i++ )
        {
            var eaItem = eventList.items[i];//.at(i);
            var name = eventList.listName;
            var picturePath =  "image://" + name + "/" +i.toString();
            var dic = {
                "itemType" : eaItem.itemType
                , "title" : eaItem.title
                , "displayText" : eaItem.displayText
                , "showUrl" : eaItem.url
                , "urlString" : eaItem.urlString
                , "picture" : picturePath
            };
            itemsModel.append(dic);
        }
    }

    addItem.onPressed: {
        eaListDisplayPage.featuredList.formatedList = false;
        //eaContainer.insertEmptyItemList(0, newListName.text);
        var c= itemTitle.text;
        var a = itemData.text;
        var b = textFilename.text;
        var ii = itemDataType.currentIndex;
        var itemType = itemDataType.currentIndex;
        eaListDisplayPage.featuredList.insertListItem(itemsModel.count
                                    , itemDataType.currentIndex
                                    , itemTitle.text
                                    , itemData.text
                                    , textFilename.text
                                    , urlItem.text);
        var index = ldpEventAppPage.stackCtl.currentIndex;
        var listView = ldpEventAppPage.stackCtl.children[index];
        var tp = listView.temp;
        listView.resetDataImageLM();
        //listView.resetDataListModel();

        popItemList(eaListDisplayPage.featuredList);
    }

    updateItem.onPressed: {
        eaItem = eventList.items[i];
        popItemList(eaListDisplayPage.featuredList);
    }

    deleteBut.onPressed: {
        itemsModel.remove(itmesEntered.currentIndex);
        popItemList(eaListDisplayPage.featuredList);
    }

    clearBut.onPressed: {
        itmesEntered.currentIndex = -1;
        itemDataType.currentIndex = -1;
        itemTitle.text = "";
        itemData.text = ""
        textFilename.text = "";
        urlItem.text = "";
    }

    switchFormat.onPressed: {
        eaListDisplayPage.featuredList.formatedList = true;
        listItemEntryStack.currentIndex = 1;
    }

    mouseAreaLV.onClicked: {
        var index = itmesEntered.indexAt(mouse.x, mouse.y);
        itmesEntered.currentIndex = index;
        itemDataType.currentIndex = itemsModel.get(index).itemType;
        itemTitle.text = itemsModel.get(index).title;
        itemData.text = itemsModel.get(index).picture;
        textFilename.text = itemsModel.get(index).displayText;
        urlItem.text = itemsModel.get(index).urlString;
    }



}