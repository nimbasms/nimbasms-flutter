library nimbasms_flutter;

import 'dart:convert';
import 'package:http/http.dart' as http;

class NimbaSms {
	final String serviceId;
	final String secret;
	final String apiKey;
	static const String baseUrl = 'https://api.nimbasms.com/v1';

	NimbaSms({required this.serviceId, required this.secret})
		: apiKey = base64Encode(utf8.encode('$serviceId:$secret'));

	/// Sends an SMS using the Nimba SMS API.
	Future<Map<String, dynamic>> sendSms({
		required String senderName,
		required List<String> recipients,
		required String message,
	}) async {

    print(apiKey);
		final url = Uri.parse('$baseUrl/messages');
		final headers = {
			'Content-Type': 'application/json',
			'Authorization': 'Basic $apiKey',
		};
		final body = jsonEncode({
			'sender_name': senderName,
			'to': recipients,
			'message': message,
		});

		final response = await http.post(
			url,
			headers: headers,
			body: body,
		);

		if (response.statusCode == 201) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to send SMS: ${response.body}');
		}
	}

	/// Retrieves all messages via the Nimba SMS API.
	Future<List<dynamic>> getMessages() async {
		final url = Uri.parse('$baseUrl/messages');
		final headers = {
			'Authorization': 'Basic $apiKey',
		};

		final response = await http.get(
			url,
			headers: headers,
		);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to retrieve messages: ${response.body}');
		}
	}

	/// Retrieves details of a specific message via the Nimba SMS API.
	Future<Map<String, dynamic>> getMessageById(String messageId) async {
		final url = Uri.parse('$baseUrl/messages/$messageId');
		final headers = {
			'Authorization': 'Basic $apiKey',
		};

		final response = await http.get(
			url,
			headers: headers,
		);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to retrieve message details: ${response.body}');
		}
	}

	/// Retrieves account details via the Nimba SMS API.
	Future<Map<String, dynamic>> getAccountDetails() async {
		final url = Uri.parse('$baseUrl/accounts');
		final headers = {
			'Authorization': 'Basic $apiKey',
		};

		final response = await http.get(
			url,
			headers: headers,
		);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to retrieve account details: ${response.body}');
		}
	}

	/// Retrieves the list of contacts via the Nimba SMS API.
	Future<List<dynamic>> getContacts() async {
		final url = Uri.parse('$baseUrl/contacts');
		final headers = {
			'Authorization': 'Basic $apiKey',
		};

		final response = await http.get(
			url,
			headers: headers,
		);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to retrieve contacts: ${response.body}');
		}
	}

	/// Creates a new contact via the Nimba SMS API.
	Future<Map<String, dynamic>> createContact({
		required String name,
		required List<String> groups,
		required String numero,
	}) async {
		final url = Uri.parse('$baseUrl/contacts');
		final headers = {
			'Content-Type': 'application/json',
			'Authorization': 'Basic $apiKey',
		};
		final body = jsonEncode({
			'name': name,
			'groups': groups,
			'numero': numero,
		});

		final response = await http.post(
			url,
			headers: headers,
			body: body,
		);

		if (response.statusCode == 201) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to create contact: ${response.body}');
		}
	}

	/// Retrieves the list of groups via the Nimba SMS API.
	Future<List<dynamic>> getGroups() async {
		final url = Uri.parse('$baseUrl/groups');
		final headers = {
			'Authorization': 'Basic $apiKey',
		};

		final response = await http.get(
			url,
			headers: headers,
		);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to retrieve groups: ${response.body}');
		}
	}

	/// Creates a verification via the Nimba SMS API.
	Future<Map<String, dynamic>> createVerification({
		required String to,
	}) async {
		final url = Uri.parse('$baseUrl/verifications');
		final headers = {
			'Content-Type': 'application/json',
			'Authorization': 'Basic $apiKey',
		};
		final body = jsonEncode({
			'to': to,
		});

		final response = await http.post(
			url,
			headers: headers,
			body: body,
		);

		if (response.statusCode == 201) {
			return jsonDecode(response.body);
		} else {
			throw Exception('Failed to create verification: ${response.body}');
		}
	}
}
