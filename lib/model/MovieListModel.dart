
class MoviesModelClass {
  List<Data>? data;
  String? path;
  int? perPage;
  String? nextCursor;
  String? nextPageUrl;
  dynamic prevCursor;
  dynamic prevPageUrl;

  MoviesModelClass({this.data, this.path, this.perPage, this.nextCursor, this.nextPageUrl, this.prevCursor, this.prevPageUrl});

  MoviesModelClass.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["path"] is String) {
      path = json["path"];
    }
    if(json["per_page"] is int) {
      perPage = json["per_page"];
    }
    if(json["next_cursor"] is String) {
      nextCursor = json["next_cursor"];
    }
    if(json["next_page_url"] is String) {
      nextPageUrl = json["next_page_url"];
    }
    prevCursor = json["prev_cursor"];
    prevPageUrl = json["prev_page_url"];
  }

  static List<MoviesModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(MoviesModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["next_cursor"] = nextCursor;
    _data["next_page_url"] = nextPageUrl;
    _data["prev_cursor"] = prevCursor;
    _data["prev_page_url"] = prevPageUrl;
    return _data;
  }
}

class Data {
  String? id;
  int? movieId;
  String? originalTitle;
  String? originalLanguage;
  String? overview;
  double? popularity;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  int? adult;
  dynamic createdAt;
  dynamic updatedAt;
  List<Casts>? casts;

  Data({this.id, this.movieId, this.originalTitle, this.originalLanguage, this.overview, this.popularity, this.posterPath, this.backdropPath, this.releaseDate, this.voteAverage, this.voteCount, this.adult, this.createdAt, this.updatedAt, this.casts});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["movie_id"] is int) {
      movieId = json["movie_id"];
    }
    if(json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if(json["original_language"] is String) {
      originalLanguage = json["original_language"];
    }
    if(json["overview"] is String) {
      overview = json["overview"];
    }
    if(json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if(json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if(json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if(json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if(json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if(json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
    if(json["adult"] is int) {
      adult = json["adult"];
    }
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    if(json["casts"] is List) {
      casts = json["casts"] == null ? null : (json["casts"] as List).map((e) => Casts.fromJson(e)).toList();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["movie_id"] = movieId;
    _data["original_title"] = originalTitle;
    _data["original_language"] = originalLanguage;
    _data["overview"] = overview;
    _data["popularity"] = popularity;
    _data["poster_path"] = posterPath;
    _data["backdrop_path"] = backdropPath;
    _data["release_date"] = releaseDate;
    _data["vote_average"] = voteAverage;
    _data["vote_count"] = voteCount;
    _data["adult"] = adult;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if(casts != null) {
      _data["casts"] = casts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Casts {
  String? id;
  int? movieId;
  String? name;
  String? originalName;
  String? popularity;
  String? profilePath;
  String? character;
  dynamic createdAt;
  dynamic updatedAt;

  Casts({this.id, this.movieId, this.name, this.originalName, this.popularity, this.profilePath, this.character, this.createdAt, this.updatedAt});

  Casts.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["movie_id"] is int) {
      movieId = json["movie_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["original_name"] is String) {
      originalName = json["original_name"];
    }
    if(json["popularity"] is String) {
      popularity = json["popularity"];
    }
    if(json["profile_path"] is String) {
      profilePath = json["profile_path"];
    }
    if(json["character"] is String) {
      character = json["character"];
    }
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Casts> fromList(List<Map<String, dynamic>> list) {
    return list.map(Casts.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["movie_id"] = movieId;
    _data["name"] = name;
    _data["original_name"] = originalName;
    _data["popularity"] = popularity;
    _data["profile_path"] = profilePath;
    _data["character"] = character;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}