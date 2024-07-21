import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../state/book.dart';
import '../widgets/rating_stars.dart';

class AddEditScreen extends StatefulWidget {
  final BookModel? book;

  AddEditScreen({this.book});

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title, _author;
  late int _rating;
  bool _isRead = false; // Default read status

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _title = widget.book!.title;
      _author = widget.book!.author;
      _rating = widget.book!.rating;
      _isRead = widget.book!.isRead;
    } else {
      _title = '';
      _author = '';
      _rating = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookState = Provider.of<BookState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Add New Book' : 'Edit Book Details'),
      ),
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  labelText: 'Book Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _title = value!,
                validator: (value) =>
                value!.isEmpty ? 'Please enter the book title' : null,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _author,
                decoration: InputDecoration(
                  labelText: 'Book Author',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _author = value!,
                validator: (value) =>
                value!.isEmpty ? 'Please enter the book author' : null,
              ),
              SizedBox(height: 16.0),
              RatingStars(
                rating: _rating,
                onRatingChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              CheckboxListTile(
                title: Text('Read'),
                value: _isRead,
                onChanged: (value) {
                  setState(() {
                    _isRead = value!;
                  });
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.book == null) {
                      bookState.addBook(BookModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: _title,
                        author: _author,
                        rating: _rating,
                        isRead: _isRead,
                      ));
                    } else {
                      bookState.editBook(BookModel(
                        id: widget.book!.id,
                        title: _title,
                        author: _author,
                        rating: _rating,
                        isRead: _isRead,
                      ));
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.book == null ? 'Add Book' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
