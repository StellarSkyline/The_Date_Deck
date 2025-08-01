class DateIdea {
    String category;
    int id;
    String name;
    String suit;

    DateIdea({required this.category, required this.id, required this.name, required this.suit});

    factory DateIdea.fromJson(Map<String, dynamic> json) {
        return DateIdea(
            category: json['category'],
            id: json['id'],
            name: json['name'],
            suit: json['Suit'],
        );
     }

    Map<String, dynamic> toJson() {
        final data = <String, dynamic>{};
        data['category'] = category;
        data['id'] = id;
        data['name'] = name;
        data['Suit'] = suit;
        return data;
     }
}