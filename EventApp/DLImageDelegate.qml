import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtLocation 5.6
import QtPositioning 5.6
import "dataList.js" as DataListJS

DLImageDelegateForm {
//Item{
  id: imageDelegate
  property int test: 76

  transitions: Transition {
        // Make the state changes smooth
        ParallelAnimation {
            ColorAnimation { property: "color"; duration: 500 }
            NumberAnimation { duration: 300; properties: "detailsOpacity,x,contentY,height,width" }
        }
  }

  function saveAnswer(text, quIndex) {
      console.log("In saveAnswers text", text);
      console.log("In saveAnswers quIndex", quIndex);
      console.log("In saveAnswers index", index);
      var ea = eaLVItemList;
      var eaIsa = eaLVItemList.items;
      var item = eaLVItemList.items[index];
      var questions = eaLVItemList.items[index].questions;
      questions[quIndex].answer = text;
  }

  maDataDelegate.onClicked: {
      dataListImage.currentIndex = index;
      imageDelegate.state = imageDelegate.state == 'Details' ? "" : "Details";
      console.log("maDataDelegate index",index);
  }

  photoImage.width: eaLVItemList.showPhotos ? 50 : 0

  closeBut.onPressed: {
      dataListImage.currentIndex = index;
      imageDelegate.state = imageDelegate.state == 'Details' ? "" : "Details";
      console.log("maDataDelegate index",index);
  }

  function popQuestionList (item) {
      console.log("Start popQuestionList");
      questionsModel.clear();
      var questionCount = item.questions.length;
      for ( var i=0 ; i<questionCount ; i++ )
      {
          var eaQuestion = item.questions[i];
          var dic = {
              "questionType" : eaQuestion.itemType
              , "question" : eaQuestion.question
              , "answer" : eaQuestion.answer
          };
          questionsModel.append(dic);
      }
  }

  Connections {
    target: footerBar.backBut
    onClicked: {
         imageDelegate.state = ""
    }
  }

  function popMapInfo(mapInfo) {
      if (undefined !== mapInfo && null !== mapInfo) {
          setMapPlugin(map, mapInfo.accessToken, mapInfo.mapId);

          //setMapPlugin(map
          //             , "pk.eyJ1Ijoic3JpZXAiLCJhIjoiY2l2aWgxb21oMDA2eDJ6cGZzMHBrYmozdCJ9.qiqUQDSmGbN9Yy0856efSQ"
          //             ,"examples.map-zr0njcqy");
      }
  }

  function setMapPlugin (map, token, mapId) {
      var qmlString = "import QtQuick 2.7\n"
              + "import QtLocation 5.6\n"
              + "import QtPositioning 5.6\n"
              +"Plugin {\n"
              + "\tname: \"mapbox\"\n"
              + "\tPluginParameter {\n"
              + "\t\tname: \"mapbox.access_token\"\n";
      qmlString += "\t\tvalue: \"" + token + "\"\n";
      qmlString += "\t}\n"
              + "\tPluginParameter {\n"
              + "\t\tname: \"mapbox.map_id\"\n";
      qmlString += "\t\tvalue: \"" + mapId + "\"\n\t}\n}";
      console.log("Plugin qml", qmlString);
      var newObject = Qt.createQmlObject(
                  qmlString
                 ,imageDelegate
                 ,"dynamicSnippet1");
      map.plugin = newObject;
  }

  function setIDisplayParameters() {
      //DataListJS.setBackgroundDisplayParameters(imageDelegate.itemBackground

      DataListJS.setBackgroundDisplayParameters(imageDelegate.background
                                               ,eaContainer.eaConstruction.display
                                               ,imageDelegate);
      DataListJS.setImageDisplyaParameters(imageDelegate.photoImage
                                           ,eaContainer.eaConstruction.display);
      DataListJS.setTextBoxDisplayParameters(imageDelegate.topText
                                             ,eaContainer.eaConstruction.display)
  }

}


















