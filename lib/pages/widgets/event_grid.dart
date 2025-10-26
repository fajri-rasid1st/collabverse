import 'package:flutter/material.dart';
import 'event_card.dart';

class EventGrid extends StatelessWidget {
  const EventGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'category': 'Musik',
        'title': 'Open Mic Bulanan Kemang',
        'status': 'open',
        'distance': '2.8 km',
        'people': '4 orang',
        'score': '99%',
        'location': 'Kedai Kopi Senja, Jakarta, DKI Jakarta',
        'role': 'Penyanyi, Gitaris, Drummer',
      },
      {
        'category': 'Film/Videograf',
        'title': 'Casting Iklan Minuman Lokal',
        'status': 'open',
        'distance': '3.5 km',
        'people': '2 orang',
        'score': '90%',
        'location': 'Studio Sumar Bandung, Bandung, Jawa Barat',
        'role': 'Aktor',
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 80),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return EventCard(event: event);
          },
        ),
      ),
    );
  }
}
