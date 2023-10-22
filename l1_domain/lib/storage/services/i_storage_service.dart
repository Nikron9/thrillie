import 'package:l1_domain/base/export.dart';

abstract class IStorageService implements IInitializable {
  Future<void> write(
    String key,
    String value,
  );

  Future<String?> read(
    String key,
  );
}
