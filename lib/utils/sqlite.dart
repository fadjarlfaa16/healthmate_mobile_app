import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance.
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  // Getter for the database instance.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database in a writable directory.
  Future<Database> _initDatabase() async {
    // Get the path to the default databases directory on the device.
    final databasesPath = await getDatabasesPath();
    // Create a full path by joining the databases path with the database name.
    final path = join(databasesPath, 'chat.db');
    print("Database will be created/opened at: $path");

    // Open the database, creating it if it doesn't exist.
    // Note: We are not specifying readOnly, so it opens for writing.
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the chat table.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE chat(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT,
        message TEXT,
        timestamp TEXT
      )
    ''');
    print("Database table 'chat' created successfully.");
  }

  // Insert a message into the chat table.
  Future<int> insertMessage(Map<String, dynamic> message) async {
    final db = await database;
    int id = await db.insert('chat', message);
    print("Inserted message with id: $id");
    return id;
  }

  // Retrieve all messages ordered by id.
  Future<List<Map<String, dynamic>>> getMessages() async {
    final db = await database;
    return await db.query('chat', orderBy: 'id ASC');
  }

  // Clear all chat messages.
  Future<int> clearChat() async {
    final db = await database;
    return await db.delete('chat');
  }
}
