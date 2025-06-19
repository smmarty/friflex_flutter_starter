// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_colors_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorsTailorMixin on ThemeExtension<AppColors> {
  Color get testColor;
  Color get itemTextColor;
  Color get errorSnackbarBackground;
  Color get successSnackbarBackground;
  Color get infoSnackbarBackground;

  @override
  AppColors copyWith({
    Color? testColor,
    Color? itemTextColor,
    Color? errorSnackbarBackground,
    Color? successSnackbarBackground,
    Color? infoSnackbarBackground,
  }) {
    return AppColors(
      testColor: testColor ?? this.testColor,
      itemTextColor: itemTextColor ?? this.itemTextColor,
      errorSnackbarBackground:
          errorSnackbarBackground ?? this.errorSnackbarBackground,
      successSnackbarBackground:
          successSnackbarBackground ?? this.successSnackbarBackground,
      infoSnackbarBackground:
          infoSnackbarBackground ?? this.infoSnackbarBackground,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this as AppColors;
    return AppColors(
      testColor: Color.lerp(testColor, other.testColor, t)!,
      itemTextColor: Color.lerp(itemTextColor, other.itemTextColor, t)!,
      errorSnackbarBackground: Color.lerp(
        errorSnackbarBackground,
        other.errorSnackbarBackground,
        t,
      )!,
      successSnackbarBackground: Color.lerp(
        successSnackbarBackground,
        other.successSnackbarBackground,
        t,
      )!,
      infoSnackbarBackground: Color.lerp(
        infoSnackbarBackground,
        other.infoSnackbarBackground,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(testColor, other.testColor) &&
            const DeepCollectionEquality().equals(
              itemTextColor,
              other.itemTextColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorSnackbarBackground,
              other.errorSnackbarBackground,
            ) &&
            const DeepCollectionEquality().equals(
              successSnackbarBackground,
              other.successSnackbarBackground,
            ) &&
            const DeepCollectionEquality().equals(
              infoSnackbarBackground,
              other.infoSnackbarBackground,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(testColor),
      const DeepCollectionEquality().hash(itemTextColor),
      const DeepCollectionEquality().hash(errorSnackbarBackground),
      const DeepCollectionEquality().hash(successSnackbarBackground),
      const DeepCollectionEquality().hash(infoSnackbarBackground),
    );
  }
}

extension AppColorsBuildContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
