# apk-resigner
A simple command-line that helps simplify generating a keystore and re-signing Android APK files.

### Configuration
Before runnign the script, you will need to configure some basic keystore parametes.
Open the script and update the following variables:
* `ALIAS`: keystore alias
* `PASS`: keystore password
* `KEYSTORE`: keystore name

### Usage
##### Creating a new keystore
```
./resigner.sh --generate
```

##### Creating a new keystore
```
./resigner.sh --sign --apk=application.apk 
```

### Requirements
* Android SDK tools