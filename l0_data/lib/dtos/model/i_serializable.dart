abstract class ISerializable {
  ISerializable fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap();
  ISerializable fromJson(String json);
  String toJson();
}
