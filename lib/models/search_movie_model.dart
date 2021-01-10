import 'dart:convert';

class SearchMovieModel {
  String Title;
  String Year;
  String Released;
  String Poster;
  SearchMovieModel({
    this.Title,
    this.Year,
    this.Released,
    this.Poster,
  });

  SearchMovieModel copyWith({
    String Title,
    String Year,
    String Released,
    String Poster,
  }) {
    return SearchMovieModel(
      Title: Title ?? this.Title,
      Year: Year ?? this.Year,
      Released: Released ?? this.Released,
      Poster: Poster ?? this.Poster,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': Title,
      'Year': Year,
      'Released': Released,
      'Poster': Poster,
    };
  }

  factory SearchMovieModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchMovieModel(
      Title: map['Title'],
      Year: map['Year'],
      Released: map['Released'],
      Poster: map['Poster'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchMovieModel.fromJson(Map<String, dynamic> source) =>
      SearchMovieModel.fromMap(source);

  @override
  String toString() {
    return 'SearchMovieModel(Title: $Title, Year: $Year, Released: $Released, Poster: $Poster)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchMovieModel &&
        o.Title == Title &&
        o.Year == Year &&
        o.Released == Released &&
        o.Poster == Poster;
  }

  @override
  int get hashCode {
    return Title.hashCode ^ Year.hashCode ^ Released.hashCode ^ Poster.hashCode;
  }
}
