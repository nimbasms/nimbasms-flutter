# nimbasms_flutter

`nimbasms_flutter` is a Flutter plugin for interacting with the Nimba SMS API. It allows you to send SMS, manage contacts, retrieve messages, and perform other SMS-related operations using the Nimba SMS service.

## Features

- [x] Send SMS
- [x] Retrieve all messages
- [x] Retrieve a specific message by ID
- [x] Retrieve account details
- [x] Retrieve the list of contacts
- [x] Create a new contact
- [x] Retrieve the list of groups
- [ ] Create a verification
- [ ] Request verification

### Tested Platforms and Status

- [x] iOS - Tested and working
- [x] macOS - Tested and working
- [x] Android - Tested and working
- [ ] Windows - Not tested yet
- [ ] Linux - Not tested yet
- [x] Web - Tested and working

## Getting Started

### Installation

Add `nimbasms_flutter` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  nimbasms_flutter: ^1.0.0
```

### Platform-specific Setup

To enable network access for your application, you need to configure specific settings for iOS, macOS, and Android.

#### iOS and macOS

To enable network access for your application on iOS and macOS, you need to modify the entitlement files and add the necessary permissions:

**Update Entitlements**:

1. Open the `ios/Runner/Runner.entitlements` file for iOS and the `macos/Runner/DebugProfile.entitlements` and `macos/Runner/Release.entitlements` files for macOS.
2. Add the following lines to allow your application to make network requests:

```xml
<key>com.apple.security.network.client</key>
<true/>
```

#### Android

For Android, you need to add the Internet permission to allow your application to access the network.

1. Open the `android/app/src/main/AndroidManifest.xml` file.
2. Add the following line inside the `<manifest>` tag to grant Internet access:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```