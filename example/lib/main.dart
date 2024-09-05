import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:nimbasms_flutter/nimbasms_flutter.dart';

void main() async {
	

  runApp(const MyWidget());


}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    testSendMessage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> testSendMessage() async {
    final nimbaSms = NimbaSms(
		serviceId: '6cdf34aa4e95e37bbe8f9aa927fc1694',
		secret: 'fIATcSdxbzAmTKcxZgP8cdQ2nuUDPPhCT1v9Bfa3hJTEHFnkWxyh6hWg8BGtBudZ0V7sVTXsusYLiz-l-fVfJ1wyyBljkWrNDAjOMu6A5qE',
	);

	try {
		// Send an SMS
		Map<String, dynamic> smsResponse = await nimbaSms.sendSms(
			senderName: 'Sonoya POS',
			recipients: ['627044179'],
			message: 'Hello, Nimba SMS',
		);
		print('SMS sent successfully: $smsResponse');
	} catch (e) {
		print('Error: $e');
	}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(),
      ),
    );
  }
}
