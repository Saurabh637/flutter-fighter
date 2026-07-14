/// Abstract service for local file storage.
abstract class StorageService {
  Future<void> saveFile(String path, List<int> bytes);
  Future<List<int>?> readFile(String path);
  Future<void> deleteFile(String path);
}
