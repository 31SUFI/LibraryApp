import 'package:flutter/material.dart';

class BookContentScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  BookContentScreen({required this.book});

  @override
  _BookContentScreenState createState() => _BookContentScreenState();
}

class _BookContentScreenState extends State<BookContentScreen> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book['title']),
        actions: [
          IconButton(
            icon: Icon(isDarkTheme ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () {
              setState(() {
                isDarkTheme = !isDarkTheme;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.book['imageUrl']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Position at the bottom
            left: 0, // Position at the left
            right: 0, // Extend to the right
            child: Container(
              decoration: BoxDecoration(
                color: isDarkTheme ? Colors.black54 : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height *
                  0.8, // 90% of screen height
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is the book content for ${widget.book['title']} by ${widget.book['author']}.\n\n[Dummy content goes here]',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
