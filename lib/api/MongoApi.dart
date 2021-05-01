import 'package:mongo_dart/mongo_dart.dart';

class MongoApi {
  static String _collection = "blog";
  Db _db;
  static MongoApi _instance;

  static MongoApi get instance {
    if (_instance == null) {
      _instance = new MongoApi();
    }
    return _instance;
  }

  void initDatabase() async {
    _db = await Db.create(
        "mongodb+srv://admin:admin123@lhthang.exmi2.mongodb.net/portforlio?ssl=true&retryWrites=true&w=majority");
    await _db.open(secure: true);
    print(_db.isConnected);
  }

  Future<void> writeBlog() async {
    _db.collection(_collection).insert({"a": "b"});
  }
}
