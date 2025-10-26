import 'package:flutter/material.dart';
import '../pages/widgets/event_tabs.dart';
import '../pages/widgets/event_grid.dart';

class EventBoardPage extends StatefulWidget {
  const EventBoardPage({super.key});

  @override
  State<EventBoardPage> createState() => _EventBoardPageState();
}

class _EventBoardPageState extends State<EventBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Event Board',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 72, 36, 119),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Color.fromARGB(255, 72, 36, 119)),
          ),
        ],
        bottom: EventTabs(controller: _tabController),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [EventGrid(), EventGrid(), EventGrid()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 72, 36, 119),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(255, 72, 36, 119),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
