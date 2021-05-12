import 'package:moor/moor.dart';
import 'images_products.dart';

export 'database/shared.dart';

part 'database.g.dart';

/// Tabla para los productos
class Products extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text()();
  TextColumn get price => text()();
  TextColumn get description => text()();
  TextColumn get images =>
      text().map(const ImagesConverter()).nullable()();
}

/// Generamos la database MyDatabase
@UseMoor(tables: [Products,/* ImagesProducts, ProductsEntries*/])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  // Queries
  /// Recuperamos todos los productos
  Future<List<Product>> getAllProducts() => select(products).get();

  /// Recuperamos todos los productos como stream para actualizar la lista cada vez que haya un cambio
  Stream<List<Product>> getStreamAllProducts() => select(products).watch();

  /// Introducimos un producto
  Future insertProduct(Product product) => into(products).insert(product);

  /// Modificamos un producto
  Future updateProduct(Product product) => update(products).replace(product);

  /// Eliminamos un producto
  Future deleteProduct(Product product) => delete(products).delete(product);
}