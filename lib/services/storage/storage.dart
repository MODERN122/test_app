import 'package:test_app/services/storage/storage_performer.dart';

///Класс для работы с хранилищем
class Storage {
  IStoragePerformer _storage = SharedPref();

  //keys
  final String _token = 'token';

  ///Проверяет на наличие токена
  Future<bool> containsToken() async {
    var res = await _storage.contains(_token);
    return res;
  }

  ///Получить токен, иначе вернуть исключение
  Future<String> loadToken() async {
    String? res = await _storage.read<String>(_token);
    if (res?.isNotEmpty ?? false) {
      return res!;
    } else {
      throw Exception();
    }
  }

  ///Удалить токен
  Future<bool> deleteToken() async {
    return await _storage.delete(_token);
  }

  ///Сохранить токен
  Future<bool> saveToken(String token) {
    return _storage.write<String>(_token, token);
  }
}
