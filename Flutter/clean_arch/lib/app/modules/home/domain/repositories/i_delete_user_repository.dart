abstract class IDeleteUserRepository {
  Future<Map<String, dynamic>> call(String id);
}
