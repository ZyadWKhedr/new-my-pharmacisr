import 'package:sqflite/sqflite.dart';
import '../../domain/entities/medicine.dart';

class SQLiteService {
  static Database? _db;

  static Future<void> initDB() async {
    _db ??= await openDatabase(
      'medicines.db',
      version: 2, // Increment version number when schema changes
      onCreate: (db, version) {
        _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          // Handle migration from version 1 to 2
          db.execute('ALTER TABLE favorites ADD COLUMN id TEXT');
        }
      },
    );
  }

  static void _createTables(Database db) {
    db.execute('''
      CREATE TABLE favorites (
        id TEXT PRIMARY KEY,
        name TEXT,
        composition TEXT,
        uses TEXT,
        sideEffects TEXT,
        imageUrl TEXT,
        manufacturer TEXT
      )
    ''');
    db.execute('''
      CREATE TABLE reminders (
        name TEXT PRIMARY KEY,
        time TEXT
      )
    ''');
  }

  Future<void> addFavorite(Medicine med) async {
    await _db!.insert('favorites', {
      'id': med.id,
      'name': med.name,
      'composition': med.composition,
      'uses': med.uses,
      'sideEffects': med.sideEffects,
      'imageUrl': med.imageUrl,
      'manufacturer': med.manufacturer,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Medicine>> getFavorites() async {
    final result = await _db!.query('favorites');
    return result
        .map(
          (e) => Medicine(
            id: e['id'] as String,
            name: e['name'] as String,
            composition: e['composition'] as String,
            uses: e['uses'] as String,
            sideEffects: e['sideEffects'] as String,
            imageUrl: e['imageUrl'] as String,
            manufacturer: e['manufacturer'] as String,
          ),
        )
        .toList();
  }

  Future<void> addReminder(String name, String time) async {
    await _db!.insert('reminders', {
      'name': name,
      'time': time,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getReminders() async {
    return await _db!.query('reminders');
  }
}
