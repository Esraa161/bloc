import 'dart:ffi';

import 'package:bloc_api/dynamic%20theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings"
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
          itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              context.read<ThemeBloc>().add(ThemeChangedEvent(theme: AppTheme.values[index]!));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: appThemeData[AppTheme.values[index!]]!.primaryColor!,
              child: Text(AppTheme.values[index!]!.name),
            ),
          );
          }),
    );
  }
}
