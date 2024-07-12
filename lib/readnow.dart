import 'package:flutter/material.dart';

class BookContentScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  BookContentScreen({required this.book});

  @override
  _BookContentScreenState createState() => _BookContentScreenState();
}

class _BookContentScreenState extends State<BookContentScreen> {
  bool isDarkTheme = false;
  double fontSize = 16.0;

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
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: isDarkTheme ? 0.3 : 0.1,
              child: Image.asset(
                widget.book['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: isDarkTheme
                    ? Colors.black87
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'This is the book content for ${widget.book['title']} by ${widget.book['author']}.\n\n[Dummy content goes here]',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: isDarkTheme ? Colors.white : Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.zoom_out),
                        onPressed: () {
                          setState(() {
                            fontSize = (fontSize - 2).clamp(10.0, 30.0);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.zoom_in),
                        onPressed: () {
                          setState(() {
                            fontSize = (fontSize + 2).clamp(10.0, 30.0);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
