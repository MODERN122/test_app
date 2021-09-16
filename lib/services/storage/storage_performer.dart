import 'package:shared_preferences/shared_preferences.dart';

///Интерфейс для работы с хранилищем
abstract class IStoragePerformer {
  ///Получить `значение` по `ключу`
  Future<T?> read<T>(String key);

  ///Записать `значение` по `ключу`
  Future<bool> write<T>(String key, T value);

  ///Удалить знеачение по `ключу`
  Future<bool> delete(String key);

  ///Проверить на наличие значения
  Future<bool> contains(String key);
}

///Реализация интерфейса для работы с хранилищем через SharedPreferences
class SharedPref implements IStoragePerformer {
  @override
  Future<bool> delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<T?> read<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obj = prefs.get(key);
    return obj == null ? null : (obj as T);
  }

  @override
  Future<bool> contains(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var contains = prefs.containsKey(key);
    return contains;
  }

  ///записать `значение` по `ключу`
  ///
  ///Может выбросить исключение, если тип сохраняемого значения не совпадает с
  ///`[bool, String, int, double, List<String>]`
  @override
  Future<bool> write<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      throw Exception('$value ${T.runtimeType} not posible write');
    }
  }
}
