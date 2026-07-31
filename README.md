# Rohy

## Android release signing

Generate a private upload key:

```sh
keytool -genkeypair -v \
  -keystore android/upload-keystore.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias upload
```

Copy the signing properties template:

```sh
cp android/key.properties.example android/key.properties
```

Replace the placeholder passwords in `android/key.properties`, then build:

```sh
fvm flutter build appbundle --release
```

The keystore and populated properties file are ignored by Git. Back up the
upload keystore and its credentials securely because future updates must use
the same key.
