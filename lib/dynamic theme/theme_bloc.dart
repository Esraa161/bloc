import 'package:bloc/bloc.dart';
import 'package:bloc_api/dynamic%20theme/app_theme.dart';
import 'package:bloc_api/dynamic%20theme/theme_cach_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit)async {
    if (event is GetCurrentThemeEvent){
       final themeIndex=await ThemeCachHelper().getCachedThemeIndex();
       final theme=AppTheme.values.firstWhere((appTheme) => appTheme.index==themeIndex);
      emit(LoadedThemeState(themeData: appThemeData[theme!]!));
    }else if(event is ThemeChangedEvent){
      final themeIndex=event.theme.index;
      await ThemeCachHelper().cachThemeIndex(themeIndex);
      emit(LoadedThemeState(themeData: appThemeData[event.theme!]!));
    }
    });
  }
}
