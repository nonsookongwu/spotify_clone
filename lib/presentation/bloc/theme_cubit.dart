
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit():super(ThemeMode.system);

void updateTheme (ThemeMode theme)=> emit(theme);
  
  // @override
  // ThemeMode? fromJson(Map<String, dynamic> json) {
  //   // TODO: implement fromJson
  //   throw UnimplementedError();
  // }

  // @override
  // Map<String, dynamic>? toJson(ThemeMode state) {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }

  //  @override
  // // ThemeMode? fromJson(Map<String, dynamic> json) {
  // //   final themeString = json['theme'] as String;

  // //   return ThemeMode.values.firstWhere(
  // //     (element) => element.name == themeString,
  // //     orElse: () => ThemeMode.system,
  // //   );
  // // }
 @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
  try {
    final themeString = json['theme'] as String;
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeString,
    );
  } catch (_) {
    return ThemeMode.system;
  }
}

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'theme': state.name, // store as string
    };
  }

  
}