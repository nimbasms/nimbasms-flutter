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

This permission ensures that your application has the necessary permissions to perform network operations on Android.

## Usage

Once the platform-specific setup is complete, you can start using the `nimbasms_flutter` plugin in your Flutter application.

### 1. Import the Package

First, import the `nimbasms_flutter` package in your Dart code:

```dart
import 'package:nimbasms_flutter/nimbasms_flutter.dart';
```

### 2. Initialize the NimbaSMS Client

Create an instance of the `NimbaSMS` class with your service ID and secret:

```dart
void main() async {
  final nimbaSMS = NimbaSMS(
    serviceId: 'YOUR_SERVICE_ID',
    secret: 'YOUR_SECRET',
  );

  try {
    // Example: Send an SMS
    Map<String, dynamic> smsResponse = await nimbaSMS.send(
      senderName: 'Nimba SMS',
      recipients: ['623XXXXXXX'],
      message: 'Hello, Nimba SMS',
    );
    print('SMS sent successfully: $smsResponse');
  } catch (e) {
    print('Error: $e');
  }
}
```

### 3. Available Methods

#### Send an SMS

To send an SMS message using the Nimba SMS API:

```dart
final smsResponse = await nimbaSMS.send(
  senderName: 'Nimba SMS',  // The sender name
  recipients: ['623XXXXXXX'], // List of phone numbers
  message: 'Hello, this is a test message!',  // The SMS body
);
```

#### Retrieve All Messages

You can retrieve all messages sent through your account:

```dart
final messages = await nimbaSMS.getMessages();
print(messages);
```

#### Retrieve a Message by ID

To get the details of a specific message by its ID:

```dart
final messageDetails = await nimbaSMS.getMessageById('MESSAGE_ID');
print(messageDetails);
```

#### Retrieve Account Details

To retrieve details about your Nimba SMS account:

```dart
final accountDetails = await nimbaSMS.getAccountDetails();
print(accountDetails);
```

#### Manage Contacts

You can retrieve or create contacts using the following methods:

- **Retrieve all contacts**:

  ```dart
  final contacts = await nimbaSMS.getContacts();
  print(contacts);
  ```

- **Create a new contact**:

  ```dart
  final newContact = await nimbaSMS.createContact(
    name: 'Sona Camara',
    groups: ['Famille', 'Amis'],
    numero: '623XXXXXXX',
  );
  print(newContact);
  ```

#### Retrieve Groups

To retrieve the list of groups in your Nimba SMS account:

```dart
final groups = await nimbaSMS.getGroups();
print(groups);
```

#### Create a Verification

To create a verification request for a specific phone number:

```dart
final verification = await nimbaSMS.createVerification(
  to: '623XXXXXXX',
);
print(verification);
```

### Handling Errors

If an error occurs while using the plugin, it will throw an exception. You can catch errors like this:

```dart
try {
  final messages = await nimbaSMS.getMessages();
} catch (e) {
  print('Error: $e');
}
```

## Contributing

Contributions are welcome! If you have any suggestions, issues, or improvements, feel free to create an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
