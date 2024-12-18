import 'package:shared_preferences/shared_preferences.dart';

class ThemeCachHelper{
  Future<void>cachThemeIndex(int themeIndex)async{
    final sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setInt("THEME_INDEX", themeIndex);
}
Future<int> getCachedThemeIndex()async {
  final sharedPreferences=await SharedPreferences.getInstance();
  final cachedThemeIndex=sharedPreferences.getInt("THEME_INDEX");
  if(cachedThemeIndex!=null){
    return cachedThemeIndex;
  }else{
    return 0;
  }

}
}