import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                child: Text('SHOW BOTTOM SHEET'),
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      final theme = Theme.of(context);
                      // Using Wrap makes the bottom sheet height the height of the content.
                      // Otherwise, the height will be half the height of the screen.
                      return Wrap(
                        children: [
                          ListTile(
                            title: Text(
                              'Header',
                              style: TextStyle(color: Colors.white),
                            ),
                            tileColor: theme.colorScheme.primary,
                          ),
                          ListTile(
                            title: Text('Title 1'),
                          ),
                          ListTile(
                            title: Text('Title 2'),
                          ),
                          ListTile(
                            title: Text('Title 3'),
                          ),
                          ListTile(
                            title: Text('Title 4'),
                          ),
                          ListTile(
                            title: Text('Title 5'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
    );
  }
}