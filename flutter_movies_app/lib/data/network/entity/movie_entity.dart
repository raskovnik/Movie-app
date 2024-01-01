import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class UpcomingMovies {
    List<MovieEntity> results;

    UpcomingMovies({
        required this.results,
    });

  factory UpcomingMovies.fromJson(Map<String, dynamic> json) => _$UpcomingMoviesFromJson(json);
}

@JsonSerializable()
class MovieEntity {
    String id;
    // String resultId;
    PrimaryImage? primaryImage;
    TitleType titleType;
    TitleText titleText;
    TitleText originalTitleText;
    ReleaseYear releaseYear;
    ReleaseDate releaseDate;

    MovieEntity({
        required this.id,
        // required this.resultId,
        required this.primaryImage,
        required this.titleType,
        required this.titleText,
        required this.originalTitleText,
        required this.releaseYear,
        required this.releaseDate,
    });
  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);
}

@JsonSerializable()
class TitleText {
    String text;

    TitleText({
        required this.text,
    });

  factory TitleText.fromJson(Map<String, dynamic> json) => _$TitleTextFromJson(json);
}

@JsonSerializable()
class PrimaryImage {
    String id;
    int width;
    int height;
    String url;
    Caption caption;

    PrimaryImage({
        required this.id,
        required this.width,
        required this.height,
        required this.url,
        required this.caption,
    });
  
  factory PrimaryImage.fromJson(Map<String, dynamic> json) => _$PrimaryImageFromJson(json);
}

@JsonSerializable()
class Caption {
    String plainText;

    Caption({
        required this.plainText,
    });

  factory Caption.fromJson(Map<String, dynamic> json) => _$CaptionFromJson(json);
}

@JsonSerializable()
class ReleaseDate {
    int day;
    int month;
    int year;

    ReleaseDate({
        required this.day,
        required this.month,
        required this.year,
    });
  factory ReleaseDate.fromJson(Map<String, dynamic> json) => _$ReleaseDateFromJson(json);
}

@JsonSerializable()
class ReleaseYear {
    int year;
    dynamic endYear;

    ReleaseYear({
        required this.year,
        required this.endYear,
    });

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => _$ReleaseYearFromJson(json);
}

@JsonSerializable()
class TitleType {
    DisplayableProperty displayableProperty;
    Text text;
    Id id;
    bool isSeries;
    bool isEpisode;
    List<Category> categories;
    bool canHaveEpisodes;

    TitleType({
        required this.displayableProperty,
        required this.text,
        required this.id,
        required this.isSeries,
        required this.isEpisode,
        required this.categories,
        required this.canHaveEpisodes,
    });
  factory TitleType.fromJson(Map<String, dynamic> json) => _$TitleTypeFromJson(json);
}

@JsonSerializable()
class Category {
    Value value;

    Category({
        required this.value,
    });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}


enum Value {
    MOVIE,
    TV
}

@JsonSerializable()
class DisplayableProperty {
    Caption value;

    DisplayableProperty({
        required this.value,
    });

  factory DisplayableProperty.fromJson(Map<String, dynamic> json) => _$DisplayablePropertyFromJson(json);
}


enum Id {
    MOVIE,
    TV_MINI_SERIES,
    TV_SERIES
}

enum Text {
    MOVIE,
    TV_MINI_SERIES,
    TV_SERIES
}
