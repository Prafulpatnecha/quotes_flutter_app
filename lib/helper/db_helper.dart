import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();

  DbHelper._();

  Database? _db;

  Future get database  async => _db ?? await initDatabase();

  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'quotesBook.db');
    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''
        CREATE TABLE quotesBook(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote TEXT,
        author TEXT,
        category TEXT,
        bookMark INTEGER
        );''';
        await db.execute(sql);
      },
    );
    return _db;
  }
  Future<Future<int>> insertData(
      {required String quote,required String author,required String category,required int bookMark})
  async {
    Database? db=await database;
    String sql = '''
    INSERT INTO quotesBook (
    quote,author,category,bookMark
    ) VALUES (?,?,?,?);
    ''';
    List args = [quote,author,category,bookMark];
    return db!.rawInsert(sql,args);
  }
  // TODO DATA Have a Comes to Gather
  Future<List<Map<String, Object?>>> readData()
  async {
    Database? db= await database;
    String sql = '''
    SELECT * FROM quotesBook
    ''';
    return await db!.rawQuery(sql);
  }
  //Todo read Find and set
  // Future<List<Map<String, Object?>>> readFindData(String quote)
  // async {
  //   Database? db= await database;
  //   String sql = "SELECT * FROM quotesBook WHERE quote LIKE '%$quote%' ";
  //   return await db!.rawQuery(sql);
  // }

  void updateData()
  {
  }

  Future<Future<int>> deleteData(String quote)
  async {
    Database? db= await database;
    String sql = '''
    DELETE FROM quotesBook WHERE quote = ?;
    ''';
    List args=[quote];
    return db!.rawDelete(sql,args);
  }
}

// [
// {
// "quote":"Loneliness is my least favorite thing about life. The thing that I'm most worried about is just being alone without anybody to care for or someone who will care for me.",
// "author":"Anne Hathaway",
// "category": "Life"
// },
// ]
