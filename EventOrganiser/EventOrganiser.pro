#QT += qml quick
QT += quick quickcontrols2
QT += qml quick webview
QT += location
QT += widgets
CONFIG += c++11

#ANDROID_PACKAGE_SOURCE_DIR = $$PWD/../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build
#DEFINES += QTADMOB_QML
#include(../QtAdMob/QtAdMob.pri)


#ios {
#    QMAKE_INFO_PLIST = ios/Info.plist
#}

win32 {    
    #DEFINES += "GIT_EXE=\"\\\"C:\\\Program Files\\\Git\\\bin\\\git.exe\\\"\""
    GIT_VERSION = $$system(git describe --always --tags)
    DEFINES += "GIT_VERSION=\"\\\"$$GIT_VERSION\\\"\""
}
win64 {
    #DEFINES += "GIT_EXE=\"\\\"C:\\\Program Files\\\Git\\\bin\\\git.exe\\\"\""
    GIT_VERSION = $$system(git describe --always --tags)
    DEFINES += "GIT_VERSION=\"\\\"$$GIT_VERSION\\\"\""
}
macx {
    message(macx)
}
unix:!macx{
    #DEFINES += "GIT_EXE=\"\\\"/usr/bin/git\\\"\""
    GIT_VERSION = $$system(git describe --always --tags)
    DEFINES += "GIT_VERSION=\"\\\"$$GIT_VERSION\\\"\""
}

android: {
}
ios {
}

#https://www.everythingfrontend.com/posts/app-version-from-git-tag-in-qt-qml.html
#GIT_VERSION = $$system(git --git-dir $$PWD/.git --work-tree $$PWD describe --always --tags)
#GIT_VERSION = $system(git --git-dir $PWD/.git --work-tree $PWD describe --always --tags)
#GIT_VERSION = $$system(git describe --always --tags)
#DEFINES += GIT_VERSION=\\\"$$GIT_VERSION\\\"
#DEFINES += GIT_VERSION=\\\"$GIT_VERSION\\\"
#DEFINES+="GIT_VERSION=\\\"v0.0.2\\\""

SOURCES += main.cpp \
    ../EventAppShared/eacontainer.cpp \
    ../EventAppShared/eaconstruction.cpp \
    ../EventAppShared/eainfo.cpp \
    ../EventAppShared/httpdownload.cpp \
    ../EventAppShared/csv.cpp \
    ../EventAppShared/eaitemlist.cpp \
    ../EventAppShared/picturelistimageprovider.cpp \
    ../EventAppShared/eaitem.cpp \
    ../EventAppShared/firebase.cpp \
    ../EventAppShared/eauser.cpp \
    ../EventAppShared/eaquestion.cpp \
    ../EventAppShared/eaobjdisplay.cpp \
    ../EventAppShared/simplecrypt.cpp \
    ../EventAppShared/eamap.cpp \
    ../EventAppShared/eastrings.cpp \
    ../EventAppShared/assistant.cpp

HEADERS += \
    ../EventAppShared/eainfo.h \
    ../EventAppShared/eacontainer.h \
    ../EventAppShared/eaconstruction.h \
    ../EventAppShared/httpdownload.h \
    ../EventAppShared/eventappshared_global.h \
    ../EventAppShared/csv.h \
    ../EventAppShared/eaitemlist.h \
    ../EventAppShared/picturelistimageprovider.h \
    ../EventAppShared/eaitem.h \
    ../EventAppShared/firebase.h \
    ../EventAppShared/eauser.h \
    ../EventAppShared/eaquestion.h \
    ../EventAppShared/eaobjdisplay.h \
    ../EventAppShared/simplecrypt.h \
    ../EventAppShared/eamap.h \
    ../EventAppShared/eastrings.h \
    ../EventAppShared/assistant.h \
    ../EventAppShared/assistant.h

RESOURCES += qml.qrc \
    ../EventApp/qmlShared.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


INCLUDEPATH += $$PWD/../EventAppShared
DEPENDPATH += $$PWD/../EventAppShared
INCLUDEPATH += $$PWD/../QtAddMob
DEPENDPATH += $$PWD/../QtAddMob

DISTFILES += \
    EventOrganiser.pro.user \
    content/EAInfoThemeForm.ui.qml \
    content/EAInfoNameForm.ui.qml \
    EAInfoPageForm.ui.qml \
    EAConstructionPageForm.ui.qml \
    content/EAListDisplayPageForm.ui.qml \
    content/TitleFieldListDelegate.qml \
    content/TitleFieldListDelegateForm.ui.qml \
    content/DataListDelegateForm.ui.qml \
    content/FormatList.qml \
    content/FormatListForm.ui.qml \
    content/FormatTextDelegate.qml \
    content/InListCheckDelegate.qml \
    content/CommonDataList.qml \
    SelectListForm.ui.qml \
    content/EaldFormatedList.qml \
    content/EaldListForm.ui.qml \
    AddNewListForm.ui.qml \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/AndroidManifest.xml \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/gradle/wrapper/gradle-wrapper.jar \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/gradlew \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/res/values/libs.xml \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/build.gradle \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/gradle/wrapper/gradle-wrapper.properties \
    ../build-EventOrganiser-Android_for_armeabi_v7a_GCC_4_9_Qt_5_7_0-Debug/android-build/gradlew.bat \
    content/EaldItem.qml \
    content/EaldItemForm.ui.qml \
    content/EaDisplayParaForm.ui.qml \
    content/FontDlgForm.ui.qml \
    content/DisplayTabForm.ui.qml \
    content/EaCommonDisplayParaForm.ui.qml \
    content/EaItemListDataForm.ui.qml \
    content/Strings.ui.qml \
    content/EaStrings.ui.qml \
    content/DlgDownloadEvnetUrl.ui.qml \
    ../EventAppShared/Documents/eventApp.qhcp \
    ../EventAppShared/Documents/eventApp.qhp \
    ../EventAppShared/displays/grey.json \
    ../EventAppShared/displays/grey-white.json \
    ../EventAppShared/displays/LLaw.json \
    ../EventAppShared/displays/pumpkin.json \
    ../EventApp/displays/grey.json \
    ../EventApp/displays/grey-white.json \
    ../EventApp/displays/LLaw.json \
    ../EventApp/displays/pumpkin.json

FORMS +=

# need to find a way of doing the following on widows.
# cmd.exe /c copy /y %{sourceDir}\Documents\eventApp.qhc %{buildDir}\release\eventApp.qhc



