import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, String> event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEBFE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  event['category']!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 72, 36, 119),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              event['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color.fromARGB(255, 35, 18, 61),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  SizedBox(width: 4),
                  Text('Open', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 12,
                    color: Color.fromARGB(255, 73, 69, 79),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    event['distance']!,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.people_outline,
                    size: 12,
                    color: Color.fromARGB(255, 73, 69, 79),
                  ),
                  const SizedBox(width: 4),
                  Text(event['people']!, style: const TextStyle(fontSize: 11)),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Text(
              'Score: ${event['score']}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Text(
              'Lokasi: ${event['location']}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              'Peran: ${event['role']}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
