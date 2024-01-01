// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMovies _$UpcomingMoviesFromJson(Map<String, dynamic> json) =>
    UpcomingMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpcomingMoviesToJson(UpcomingMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      id: json['id'] as String,
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImage.fromJson(json['primaryImage'] as Map<String, dynamic>),
      titleType: TitleType.fromJson(json['titleType'] as Map<String, dynamic>),
      titleText: TitleText.fromJson(json['titleText'] as Map<String, dynamic>),
      originalTitleText:
          TitleText.fromJson(json['originalTitleText'] as Map<String, dynamic>),
      releaseYear:
          ReleaseYear.fromJson(json['releaseYear'] as Map<String, dynamic>),
      releaseDate:
          ReleaseDate.fromJson(json['releaseDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryImage': instance.primaryImage,
      'titleType': instance.titleType,
      'titleText': instance.titleText,
      'originalTitleText': instance.originalTitleText,
      'releaseYear': instance.releaseYear,
      'releaseDate': instance.releaseDate,
    };

TitleText _$TitleTextFromJson(Map<String, dynamic> json) => TitleText(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TitleTextToJson(TitleText instance) => <String, dynamic>{
      'text': instance.text,
    };

PrimaryImage _$PrimaryImageFromJson(Map<String, dynamic> json) => PrimaryImage(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
      caption: Caption.fromJson(json['caption'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrimaryImageToJson(PrimaryImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'caption': instance.caption,
    };

Caption _$CaptionFromJson(Map<String, dynamic> json) => Caption(
      plainText: json['plainText'] as String,
    );

Map<String, dynamic> _$CaptionToJson(Caption instance) => <String, dynamic>{
      'plainText': instance.plainText,
    };

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) => ReleaseDate(
      day: json['day'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
    );

Map<String, dynamic> _$ReleaseDateToJson(ReleaseDate instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };

ReleaseYear _$ReleaseYearFromJson(Map<String, dynamic> json) => ReleaseYear(
      year: json['year'] as int,
      endYear: json['endYear'],
    );

Map<String, dynamic> _$ReleaseYearToJson(ReleaseYear instance) =>
    <String, dynamic>{
      'year': instance.year,
      'endYear': instance.endYear,
    };

TitleType _$TitleTypeFromJson(Map<String, dynamic> json) => TitleType(
      displayableProperty: DisplayableProperty.fromJson(
          json['displayableProperty'] as Map<String, dynamic>),
      text: $enumDecode(_$TextEnumMap, json['text']),
      id: $enumDecode(_$IdEnumMap, json['id']),
      isSeries: json['isSeries'] as bool,
      isEpisode: json['isEpisode'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      canHaveEpisodes: json['canHaveEpisodes'] as bool,
    );

Map<String, dynamic> _$TitleTypeToJson(TitleType instance) => <String, dynamic>{
      'displayableProperty': instance.displayableProperty,
      'text': _$TextEnumMap[instance.text]!,
      'id': _$IdEnumMap[instance.id]!,
      'isSeries': instance.isSeries,
      'isEpisode': instance.isEpisode,
      'categories': instance.categories,
      'canHaveEpisodes': instance.canHaveEpisodes,
    };

const _$TextEnumMap = {
  Text.MOVIE: 'MOVIE',
  Text.TV_MINI_SERIES: 'TV_MINI_SERIES',
  Text.TV_SERIES: 'TV_SERIES',
};

const _$IdEnumMap = {
  Id.MOVIE: 'MOVIE',
  Id.TV_MINI_SERIES: 'TV_MINI_SERIES',
  Id.TV_SERIES: 'TV_SERIES',
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      value: $enumDecode(_$ValueEnumMap, json['value']),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'value': _$ValueEnumMap[instance.value]!,
    };

const _$ValueEnumMap = {
  Value.MOVIE: 'MOVIE',
  Value.TV: 'TV',
};

DisplayableProperty _$DisplayablePropertyFromJson(Map<String, dynamic> json) =>
    DisplayableProperty(
      value: Caption.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DisplayablePropertyToJson(
        DisplayableProperty instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
