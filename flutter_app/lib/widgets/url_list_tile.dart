import 'package:flutter/material.dart';
import 'package:flutter_app/screens/details.screen.dart';

class UrlListTile extends StatelessWidget {
  final Map<String, dynamic> url;

  const UrlListTile({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final String name = url['name'];
    final String shortUrl = url['shortId'];
    final String createdAt = url['createdAt'];
    final List<dynamic> visitHistory = url['visitHistory'] ?? [];
    final int clicks = visitHistory.length;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        
        leading: const Icon(Icons.link),
        
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              shortUrl,
              style: const TextStyle(color: Colors.blueAccent),
            ),
            const SizedBox(height: 4),
            Text(
              createdAt,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.ads_click_outlined, size: 20),
            const SizedBox(width: 4),
            Text('$clicks'),
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(url: url),
          ),
        ),
      ),
    );
  }
}