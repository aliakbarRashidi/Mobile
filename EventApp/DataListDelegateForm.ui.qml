import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import "dataList.js" as DataListJS

Item {
   // color: eaContainer.eaConstruction.display.backColour

    // Create a property to contain the visibility of the details.
    // We can bind multiple element's opacity to this one property,
    // rather than having a "PropertyChanges" line for each element we
    // want to fade.
    property real detailsOpacity : 0
    clip: true
    width: dataList.width
    Layout.fillWidth: true
    height: eaContainer.eaConstruction.display.height
    property alias photoImage: photoImage
    property alias maDataDelegate: maDataDelegate
    property alias itemBackground: itemBackground
    property alias bottomText: bottomText
    property alias topText: topText
    property alias closeBut: closeBut

    // A simple rounded rectangle for the background
    Rectangle {
        id: itemBackground

        color: eaContainer.eaConstruction.display.colour
        x: eaContainer.eaConstruction.display.x
        y: eaContainer.eaConstruction.display.y
        border.color: eaContainer.eaConstruction.display.borderColour
        border.width: eaContainer.eaConstruction.display.borderWidth
        radius: eaContainer.eaConstruction.display.radius
        width: parent.width - x*2
        height: parent.height - y*2
    }

    // This mouse region covers the entire delegate.
    // When clicked it changes mode to 'Details'.  If we are already
    // in Details mode, then no change will happen.
    MouseArea {
        id: maDataDelegate
        anchors.fill: parent
        //onClicked: dataDelegate.state = (dataDelegate.state == 'Details' ? "" : "Details");
    }

    // Lay out the page: picture, title and ingredients at the top, and method at the
    // bottom.  Note that elements that should not be visible in the list
    // mode have their opacity set to recipe.detailsOpacity.
  Item {
        id: topLayout
        x: 10; y: 10;
        //x: eaContainer.eaConstruction.display.borderWidth
        //y: -eaContainer.eaConstruction.display.borderWidth
        height: photoImage.height; width: parent.width
        //spacing: 10
        clip: true
        //RowLayout {
       Image {
            clip: true
            id: photoImage
            cache: false

            x : eaContainer.eaConstruction.display.xImage
            y : eaContainer.eaConstruction.display.yText
            width : eaContainer.eaConstruction.display.imageWidth
            height : eaContainer.eaConstruction.display.imageHeight

            fillMode: Image.PreserveAspectFit
            source: picture

        }

        Text {
            id: topText
            font: eaContainer.eaConstruction.display.font
            color: eaContainer.eaConstruction.display.fontColour
            style: eaContainer.eaConstruction.display.textStyle
            styleColor: eaContainer.eaConstruction.display.styleColour
            x: eaContainer.eaConstruction.display.xText
            y: eaContainer.eaConstruction.display.yText

            //x: xText < 140 ? 140 :


            height : eaContainer.eaConstruction.display.imageHeight

            //verticalAlignment: eaContainer.eaConstruction.display.vAlignment
            //horizontalAlignment: eaContainer.eaConstruction.display.hAlignment
            text: "hi"//modelData
            anchors.leftMargin: 10            
            //opacity: 0.0
            //y:10; x:10
        }
   }

    Item {
      id: details
      width: parent.width - 20
      anchors { top: topLayout.bottom; topMargin: 10; bottom: parent.bottom; bottomMargin: 10 }
      opacity: dataDelegate.detailsOpacity

      Flickable {
        id: flick
        width: parent.width
        anchors { top: parent.top; bottom: parent.bottom }
        contentHeight: bottomText.height

        clip: true
        x:5
           Text {
                id: bottomText
                font: eaContainer.eaConstruction.display.font
                color: eaContainer.eaConstruction.display.fontColour
                style: eaContainer.eaConstruction.display.textStyle
                styleColor: eaContainer.eaConstruction.display.styleColour
                //verticalAlignment: eaContainer.eaConstruction.display.vAlignment
                //horizontalAlignment: eaContainer.eaConstruction.display.hAlignment
                text: modelData
                anchors.left: parent.left
                anchors.leftMargin: 10
                y:10; x:10
                wrapMode: Text.WordWrap;
                width: details.width
            }
      }

      Image {
        anchors { right: flick.right; top: flick.top }
        source: "qrc:///shared/images/moreUp.png"
        opacity: flick.atYBeginning ? 0 : 1
      }

      Image {
        anchors { right: flick.right; bottom: flick.bottom }
        source: "qrc:///shared/images/moreDown.png"
        opacity: flick.atYEnd ? 0 : 1
      }
    }
/*
    ExpandedItemView {
        id: details
        x: 10
    }
*/
    // A button to close the detailed view, i.e. set the state back to default ('').
    Button {
        id: closeBut
        y: 10
        //anchors { right: background.right; rightMargin: 10 }
        anchors { right: dataDelegate.right;
                    bottom: dataDelegate.bottom;
                    rightMargin: 10
        }
        opacity: dataDelegate.detailsOpacity
        text: "Close"
        checked: true
       // onClicked: dataDelegate.state == 'Details' ? "" : "Details";
    }

    states: State {
        id: dldStates
        name: "Details"

        PropertyChanges {
            target: topText;
            x: showPhoto ? eaContainer.eaConstruction.display.xText + 130
               - eaContainer.eaConstruction.display.imageWidth :  eaContainer.eaConstruction.display.xText
        }

        PropertyChanges {
            target: photoImage;
            width: showPhoto ? 130 : 0;
            height: showPhoto ? 130 : 50;
        } // Make picture bigger

        PropertyChanges { target: dataDelegate; detailsOpacity: 1; x: 0 } // Make details visible
        PropertyChanges { target: dataDelegate; height: dataList.height } // Fill the entire list area with the detailed view

        // Move the list so that this item is at the top.
        PropertyChanges { target: dataDelegate.ListView.view; explicit: true; contentY: dataDelegate.y }
        //PropertyChanges { target: dataDelegate.dataList.view; explicit: true; contentY: dataDelegate.y }
        // Disallow flicking while we're in detailed view
        PropertyChanges { target: dataDelegate.ListView.view; interactive: false }
        //PropertyChanges { target: dataDelegate.dataList.view; interactive: false }
    }

}











































