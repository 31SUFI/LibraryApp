import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_app_bar.dart';
import 'flip_book_card.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'The Hitchhiker\'s Guide to the Galaxy',
      'author': 'Douglas Adams',
      'imageUrl':
          'assets/images/HitchhikersGuide.jpeg', // Replace with actual image path
      'Category': 'Science Fiction',
      'Rating': '4.5 Stars',
    },
    {
      'title': 'Harry Potter and the Philosopher’s Stone',
      'author': 'J.K. Rowling',
      'imageUrl':
          'assets/images/HarryPotter.jpeg', // Replace with actual image path
      'Category': 'Fantasy ',
      'Rating': '4 Stars',
    },
    {
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'imageUrl':
          'assets/images/ToKillAMockingbird.jpeg', // Replace with actual image path
      'Category': 'Fiction',
      'Rating': '4.5 Stars',
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'imageUrl': 'assets/images/1984.jpeg', // Replace with actual image path
      'Category': 'Dystopian Fiction',
      'Rating': '4 Stars',
    },
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'imageUrl':
          'assets/images/PrideAndPrejudice.jpeg', // Replace with actual image path
      'Category': 'Romance',
      'Rating': '4.5 Stars',
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'imageUrl':
          'assets/images/TheCatcherInTheRye.jpeg', // Replace with actual image path
      'Category': 'Coming-of-Age Fiction',
      'Rating': '4 Stars',
    },
    {
      'title': 'The Lord of the Rings',
      'author': 'J.R.R. Tolkien',
      'imageUrl': 'assets/images/lor.jpeg', // Replace with actual image path
      'Category': 'Mystery , Fantasy',
      'Rating': '5 Stars',
    },
  ];

  List<Map<String, dynamic>> filteredBooks = [];
  String searchQuery = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: CustomAppBar(
        searchController: searchController,
        onSearchChanged: (value) {
          setState(() {
            searchQuery = value;
            filteredBooks = books
                .where((book) => book['title']
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
                .toList();
          });
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return FlipBookCard(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }
}
