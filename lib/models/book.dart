class BookModel {
  final int id;
  final String title;
  final String author;
  final int rating;
  final bool isRead;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.isRead,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'rating': rating,
      'isRead': isRead ? 1 : 0, // SQLite uses 0 for false and 1 for true
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    rating: json['rating'],
    isRead: json['isRead'] == 1,
  );

  BookModel copyWith({
    int? id,
    String? title,
    String? author,
    int? rating,
    bool? isRead,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      isRead: isRead ?? this.isRead,
    );
  }
}
