import 'dart:convert';


class SearchResult {
  int? id;
  String? images;
  String? name;
  String? description;
  SearchResult({
    this.id,
    this.images,
    this.name,
    this.description,
  });

  SearchResult copyWith({
    int? id,
    String? images,
    String? name,
    String? description,
  }) {
    return SearchResult(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'name': name,
      'description': description,
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      id: map['id'] != null ? map['id'] as int : null,
      images: map['images'] != null ? map['images'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) => SearchResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SearchResult(id: $id, images: $images, name: $name, description: $description)';
  }

  @override
  bool operator ==(covariant SearchResult other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.images == images &&
      other.name == name &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      images.hashCode ^
      name.hashCode ^
      description.hashCode;
  }
}

final List<SearchResult> searchResults = [
   SearchResult(
        id: 1,
        name: 'Paul Walker',
        description: 'Fast and Furious',
        images: 'https://cdn.motor1.com/images/mgl/QyprZ/s1/daughter-of-paul-walker-suing-porsche-over-his-death.webp',
        ),
         SearchResult(
        id: 1,
        name: 'Nissan GTR R35',
        description: 'Iconic Wehicle',
        images: 'https://i.redd.it/2jtf9s72wci91.jpg',
        ),
         SearchResult(
        id: 1,
        name: 'Nissan GTR R34',
        description: 'R34 Skyline',
        images: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeLB9yWGc-QBBytLVjVYaLrOLhn4c7iek2IA&s',
        ),
         SearchResult(
        id: 1,
        name: 'Mazda RX-7 Type R',
        description: 'Mr. Han\'s Car',
        images: 'https://m.media-amazon.com/images/I/51Z+CjbECZL.jpg',
        ),
        //  SearchResult(
        // id: 1,
        // name: 'Sample 1',
        // description: 'This is a sample 1',
        // images: 'https://via.placeholder.com/150',
        // ),
        //  SearchResult(
        // id: 1,
        // name: 'Sample 1',
        // description: 'This is a sample 1',
        // images: 'https://via.placeholder.com/150',
        // ),
        //  SearchResult(
        // id: 1,
        // name: 'Sample 1',
        // description: 'This is a sample 1',
        // images: 'https://via.placeholder.com/150',
        // ),
        //  SearchResult(
        // id: 1,
        // name: 'Sample 1',
        // description: 'This is a sample 1',
        // images: 'https://via.placeholder.com/150',
        // ),
];