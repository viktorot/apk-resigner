ALIAS="debug"
PASS="debug123"
KEYSTORE="debug.keystore"

for i in "$@"
do
case $i in
    --generate)
    GENERATE=YES
    shift
    ;;
    --sign)
    SIGN=YES
    shift
    ;;
    --apk=*)
    APK="${i#*=}"
    shift
    ;;
    *)
    # unknown param
    ;;
esac
done

if [ $GENERATE ]; then
    echo "[*] Generating keystore ..." 
    keytool -genkey -v -keystore $KEYSTORE -alias $ALIAS -storepass $PASS -keyalg RSA -keysize 2048 -validity 10000
    if [ $? -ne 0 ]; then
        echo "[!] Error: generating keystore failed"
        exit 1
    fi
    echo "[+] Generating keystore completed successfully"
elif [ $SIGN ]; then
    if [ $APK ]; then
        echo "[*] Signing APK ${APK} ..."
        jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $KEYSTORE -storepass $PASS -keypass $PASS $APK $ALIAS
        if [ $? -ne 0 ]; then
            "[!] Error: APK signing failed"
        fi
        echo "[+]  APK signing completed successfully"
    else
        echo "[!] Error: --apk parameter missing"
    fi
else 
    echo "[!] Error: unknown or missing parameters"
fi