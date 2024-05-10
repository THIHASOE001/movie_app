// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularMovieAdapter extends TypeAdapter<PopularMovie> {
  @override
  final int typeId = 0;

  @override
  PopularMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularMovie(
      title: fields[0] as String,
      backDropPath: fields[1] as String,
      originalTitle: fields[2] as String,
      overView: fields[3] as String,
      posterPath: fields[4] as String,
      releaseDate: fields[5] as String,
      voteAverage: fields[6] as double,
      id: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PopularMovie obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.backDropPath)
      ..writeByte(2)
      ..write(obj.originalTitle)
      ..writeByte(3)
      ..write(obj.overView)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
