/// {@template converter.class}
/// Base class for converters.
/// {@endtemplate}
abstract base class Converter<FromType, ToType> {
  /// {@macro converter.class}
  const Converter();

  /// Convert TFrom to TResult.
  ToType convert(FromType input);

  /// Convert nullable TFrom to nullable TResult.
  ToType? convertNullable(FromType? input) =>
      input == null ? null : convert(input);

  /// Convert TFrom list to TResult list.
  Iterable<ToType> convertMultiple(Iterable<FromType> inputList) =>
      inputList.map(convert);
}

/// {@template converter_to_and_from.class}
/// Base class for converters that convert to and from a type.
/// {@endtemplate}
abstract base class ConverterToAndFrom<FromType, ToType> {
  /// TResult from TFrom converter.
  Converter<FromType, ToType> get toConverter;

  /// TFrom from TResult converter.
  Converter<ToType, FromType> get fromConverter;

  /// {@macro converter.class}
  const ConverterToAndFrom();

  /// Convert [ToType] to [FromType].
  ToType convert(FromType input) => toConverter.convert(input);

  /// Convert [FromType] to [ToType].
  FromType backConvert(ToType input) => fromConverter.convert(input);
}
