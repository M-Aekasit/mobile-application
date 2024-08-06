import 'package:flutter/material.dart';
import 'drawer_widget.dart';
import 'bottom_nav_bar.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<bool> _selectedMessages = List<bool>.filled(10, false);
  bool _isSelectMode = false;

  void _toggleSelectMode() {
    setState(() {
      _isSelectMode = !_isSelectMode;
      if (!_isSelectMode) {
        _selectedMessages = List<bool>.filled(10, false);
      }
    });
  }

  void _deleteSelectedMessages() {
    setState(() {
      _selectedMessages
          .asMap()
          .entries
          .where((entry) => entry.value)
          .forEach((entry) {
        _selectedMessages[entry.key] = false;
      });
    });
  }

  void _deleteAllMessages() {
    setState(() {
      _selectedMessages = List<bool>.filled(10, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2C2D),
        centerTitle: true,
        title: const Text(
          'Message',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
          ),
        ),
        actions: [
          if (_isSelectMode)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: _deleteSelectedMessages,
            ),
          if (_isSelectMode)
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.white),
              onPressed: _deleteAllMessages,
            ),
          IconButton(
            icon: Icon(
              _isSelectMode ? Icons.close : Icons.delete,
              color: Colors.white,
            ),
            onPressed: _toggleSelectMode,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3A3A3A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text(
                  'Factory ... Production ... Line 1, Machine 1',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  'Machine has stop working',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: _isSelectMode
                    ? Checkbox(
                        value: _selectedMessages[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedMessages[index] = value!;
                          });
                        },
                      )
                    : const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  if (_isSelectMode) {
                    setState(() {
                      _selectedMessages[index] = !_selectedMessages[index];
                    });
                  }
                },
                selected: _selectedMessages[index],
                selectedTileColor: Colors.grey.withOpacity(0.2),
              ),
            ),
          );
        },
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // Update the current index accordingly
        onTap: (index) => handleNavigation(context, index),
      ),
    );
  }
}
