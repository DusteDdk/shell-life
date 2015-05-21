#!/bin/bash
USEJAVA_JDK_DIR="/opt/jdk"
if [ "$1" == "" ]
then
        echo "usejava - select java version for shell instance."
        echo "Usage: SOURCE usejava VERSION"
        echo "  -- Looking for JDKs in $USEJAVA_JDK_DIR"
        echo "  -- JDK versions available: "`ls "$USEJAVA_JDK_DIR"|sed "s/jdk//g"`
else
        USEJAVA_JDK="$USEJAVA_JDK_DIR/jdk$1"
        if ! [ -d "$USEJAVA_JDK" ]
        then
                echo "Error: No jdk $USEJAVA_JDK"
                unset USEJAVA_JDK
        fi
fi


if ! [ "$USEJAVA_JDK" = "" ]
then
        if ! [ "$USEJAVA_OLDPATH" = "" ]
        then
                PATH="$USEJAVA_OLDPATH"
        else
                USEJAVA_OLDPATH="$PATH"
        fi

        export JAVA_HOME="$USEJAVA_JDK"
        export JAVAHOME="$USEJAVA_JDK"

        export ANDROID_JAVA_TOOLCHAIN="$USEJAVA_JDK/bin/"
        export ANDROID_JAVA_HOME="$USEJAVA_JDK"
        export PATH="$USEJAVA_JDK/bin/:$PATH"

        java -version
fi
unset USEJAVA_JDK
unset USEJAVA_JDK_DIR
