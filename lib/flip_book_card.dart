import 'package:flutter/material.dart';
import 'BookDetails.dart';
import 'dart:math';

class FlipBookCard extends StatefulWidget {
  final Map<String, dynamic> book;

  const FlipBookCard({Key? key, required this.book}) : super(key: key);

  @override
  _FlipBookCardState createState() => _FlipBookCardState();
}

class _FlipBookCardState extends State<FlipBookCard>
    with SingleTickerProviderStateMixin {
  bool _isFront = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return GestureDetector(
      onTap: () {
        if (_isFront) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailsScreen(book: book),
            ),
          );
        }
      },
      onLongPress: _flipCard,
      child: Hero(
        tag: book['title'],
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(_animation.value * 3.14159),
              child: _animation.value < 0.5
                  ? _buildFront(book)
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14159),
                      child: _buildBack(book),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFront(Map<String, dynamic> book) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 8, 8, 8)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            book['imageUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Color getRandomLightColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Full opacity
      200 + random.nextInt(56), // Ensure the color is light
      200 + random.nextInt(56),
      200 + random.nextInt(56),
    );
  }

  Widget _buildBack(Map<String, dynamic> book) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: getRandomLightColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By ${book['author']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Category: ${book['Category']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${book['Rating']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
