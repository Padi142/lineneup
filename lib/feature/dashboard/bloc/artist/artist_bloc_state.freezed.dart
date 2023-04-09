// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<ArtistModel> artists) loadedArtists,
    required TResult Function(List<SpotifyArtistData> artists) searchedArtists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<ArtistModel> artists)? loadedArtists,
    TResult? Function(List<SpotifyArtistData> artists)? searchedArtists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<ArtistModel> artists)? loadedArtists,
    TResult Function(List<SpotifyArtistData> artists)? searchedArtists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(LoadedArtists value) loadedArtists,
    required TResult Function(SearchedArtists value) searchedArtists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(LoadedArtists value)? loadedArtists,
    TResult? Function(SearchedArtists value)? searchedArtists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(LoadedArtists value)? loadedArtists,
    TResult Function(SearchedArtists value)? searchedArtists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistStateCopyWith<$Res> {
  factory $ArtistStateCopyWith(
          ArtistState value, $Res Function(ArtistState) then) =
      _$ArtistStateCopyWithImpl<$Res, ArtistState>;
}

/// @nodoc
class _$ArtistStateCopyWithImpl<$Res, $Val extends ArtistState>
    implements $ArtistStateCopyWith<$Res> {
  _$ArtistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ArtistState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<ArtistModel> artists) loadedArtists,
    required TResult Function(List<SpotifyArtistData> artists) searchedArtists,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<ArtistModel> artists)? loadedArtists,
    TResult? Function(List<SpotifyArtistData> artists)? searchedArtists,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<ArtistModel> artists)? loadedArtists,
    TResult Function(List<SpotifyArtistData> artists)? searchedArtists,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(LoadedArtists value) loadedArtists,
    required TResult Function(SearchedArtists value) searchedArtists,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(LoadedArtists value)? loadedArtists,
    TResult? Function(SearchedArtists value)? searchedArtists,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(LoadedArtists value)? loadedArtists,
    TResult Function(SearchedArtists value)? searchedArtists,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ArtistState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ArtistState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<ArtistModel> artists) loadedArtists,
    required TResult Function(List<SpotifyArtistData> artists) searchedArtists,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<ArtistModel> artists)? loadedArtists,
    TResult? Function(List<SpotifyArtistData> artists)? searchedArtists,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<ArtistModel> artists)? loadedArtists,
    TResult Function(List<SpotifyArtistData> artists)? searchedArtists,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(LoadedArtists value) loadedArtists,
    required TResult Function(SearchedArtists value) searchedArtists,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(LoadedArtists value)? loadedArtists,
    TResult? Function(SearchedArtists value)? searchedArtists,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(LoadedArtists value)? loadedArtists,
    TResult Function(SearchedArtists value)? searchedArtists,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ArtistState {
  const factory Error(final String error) = _$Error;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedArtistsCopyWith<$Res> {
  factory _$$LoadedArtistsCopyWith(
          _$LoadedArtists value, $Res Function(_$LoadedArtists) then) =
      __$$LoadedArtistsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ArtistModel> artists});
}

/// @nodoc
class __$$LoadedArtistsCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res, _$LoadedArtists>
    implements _$$LoadedArtistsCopyWith<$Res> {
  __$$LoadedArtistsCopyWithImpl(
      _$LoadedArtists _value, $Res Function(_$LoadedArtists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artists = null,
  }) {
    return _then(_$LoadedArtists(
      null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistModel>,
    ));
  }
}

/// @nodoc

class _$LoadedArtists implements LoadedArtists {
  const _$LoadedArtists(final List<ArtistModel> artists) : _artists = artists;

  final List<ArtistModel> _artists;
  @override
  List<ArtistModel> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  String toString() {
    return 'ArtistState.loadedArtists(artists: $artists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedArtists &&
            const DeepCollectionEquality().equals(other._artists, _artists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_artists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedArtistsCopyWith<_$LoadedArtists> get copyWith =>
      __$$LoadedArtistsCopyWithImpl<_$LoadedArtists>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<ArtistModel> artists) loadedArtists,
    required TResult Function(List<SpotifyArtistData> artists) searchedArtists,
  }) {
    return loadedArtists(artists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<ArtistModel> artists)? loadedArtists,
    TResult? Function(List<SpotifyArtistData> artists)? searchedArtists,
  }) {
    return loadedArtists?.call(artists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<ArtistModel> artists)? loadedArtists,
    TResult Function(List<SpotifyArtistData> artists)? searchedArtists,
    required TResult orElse(),
  }) {
    if (loadedArtists != null) {
      return loadedArtists(artists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(LoadedArtists value) loadedArtists,
    required TResult Function(SearchedArtists value) searchedArtists,
  }) {
    return loadedArtists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(LoadedArtists value)? loadedArtists,
    TResult? Function(SearchedArtists value)? searchedArtists,
  }) {
    return loadedArtists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(LoadedArtists value)? loadedArtists,
    TResult Function(SearchedArtists value)? searchedArtists,
    required TResult orElse(),
  }) {
    if (loadedArtists != null) {
      return loadedArtists(this);
    }
    return orElse();
  }
}

abstract class LoadedArtists implements ArtistState {
  const factory LoadedArtists(final List<ArtistModel> artists) =
      _$LoadedArtists;

  List<ArtistModel> get artists;
  @JsonKey(ignore: true)
  _$$LoadedArtistsCopyWith<_$LoadedArtists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchedArtistsCopyWith<$Res> {
  factory _$$SearchedArtistsCopyWith(
          _$SearchedArtists value, $Res Function(_$SearchedArtists) then) =
      __$$SearchedArtistsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SpotifyArtistData> artists});
}

/// @nodoc
class __$$SearchedArtistsCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res, _$SearchedArtists>
    implements _$$SearchedArtistsCopyWith<$Res> {
  __$$SearchedArtistsCopyWithImpl(
      _$SearchedArtists _value, $Res Function(_$SearchedArtists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artists = null,
  }) {
    return _then(_$SearchedArtists(
      null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<SpotifyArtistData>,
    ));
  }
}

/// @nodoc

class _$SearchedArtists implements SearchedArtists {
  const _$SearchedArtists(final List<SpotifyArtistData> artists)
      : _artists = artists;

  final List<SpotifyArtistData> _artists;
  @override
  List<SpotifyArtistData> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  String toString() {
    return 'ArtistState.searchedArtists(artists: $artists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedArtists &&
            const DeepCollectionEquality().equals(other._artists, _artists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_artists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchedArtistsCopyWith<_$SearchedArtists> get copyWith =>
      __$$SearchedArtistsCopyWithImpl<_$SearchedArtists>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<ArtistModel> artists) loadedArtists,
    required TResult Function(List<SpotifyArtistData> artists) searchedArtists,
  }) {
    return searchedArtists(artists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<ArtistModel> artists)? loadedArtists,
    TResult? Function(List<SpotifyArtistData> artists)? searchedArtists,
  }) {
    return searchedArtists?.call(artists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<ArtistModel> artists)? loadedArtists,
    TResult Function(List<SpotifyArtistData> artists)? searchedArtists,
    required TResult orElse(),
  }) {
    if (searchedArtists != null) {
      return searchedArtists(artists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(LoadedArtists value) loadedArtists,
    required TResult Function(SearchedArtists value) searchedArtists,
  }) {
    return searchedArtists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(LoadedArtists value)? loadedArtists,
    TResult? Function(SearchedArtists value)? searchedArtists,
  }) {
    return searchedArtists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(LoadedArtists value)? loadedArtists,
    TResult Function(SearchedArtists value)? searchedArtists,
    required TResult orElse(),
  }) {
    if (searchedArtists != null) {
      return searchedArtists(this);
    }
    return orElse();
  }
}

abstract class SearchedArtists implements ArtistState {
  const factory SearchedArtists(final List<SpotifyArtistData> artists) =
      _$SearchedArtists;

  List<SpotifyArtistData> get artists;
  @JsonKey(ignore: true)
  _$$SearchedArtistsCopyWith<_$SearchedArtists> get copyWith =>
      throw _privateConstructorUsedError;
}
