abstract class AddressRepository {
  Future<String?> getAddress(String lat, String lon);
}