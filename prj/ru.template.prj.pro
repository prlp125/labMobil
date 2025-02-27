QT += sensors \
      dbus \

TARGET = ru.template.prj

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/CompasPage.qml \
    qml/pages/FmPage.qml \
    rpm/ru.template.prj.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.template.prj.ts \
    translations/ru.template.prj-ru.ts \
