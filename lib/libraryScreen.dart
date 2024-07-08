import 'package:flutter/material.dart';
import 'BookDetails.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'The Lord of the Rings',
      'author': 'J.R.R. Tolkien',
      'imageUrl': 'assets/images/lor.jpeg', // Replace with actual image path
    },
    {
      'title': 'Harry Potter and the Philosopher’s Stone',
      'author': 'J.K. Rowling',
      'imageUrl':
          'assets/images/HarryPotter.jpeg', // Replace with actual image path
    },
    // Add more books here
  ];

  List<Map<String, dynamic>> filteredBooks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          //automaticallyImplyLeading: false, // Remove the back arrow
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(
                right: 10.0, left: 150), // Align search bar to the left
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filteredBooks = books
                      .where((book) => book['title']
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search books',
                suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
          ),
        ),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(book: book),
                      ),
                    );
                  },
                  child: Hero(
                    tag: book['title'], // Use a unique tag for each book
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 8, 8, 8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.asset(
                                  book['imageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'By ${book['author']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
