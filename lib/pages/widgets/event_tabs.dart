import 'package:flutter/material.dart';

class EventTabs extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  const EventTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          controller: controller,
          isScrollable: true,
          labelColor: const Color.fromARGB(255, 72, 36, 119),
          unselectedLabelColor: Colors.black54,
          indicatorColor: const Color(0xFF6C5CE7),
          tabs: const [
            Tab(text: 'Rekomendasi'),
            Tab(text: 'Semua'),
            Tab(text: 'Terdekat'),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
