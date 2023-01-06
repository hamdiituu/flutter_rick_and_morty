// {
// "id": 1,
// "name": "Earth (C-137)",
// "type": "Planet",
// "dimension": "Dimension C-137",
// "residents":["https://rickandmortyapi.com/api/character/38", "https://rickandmortyapi.com/api/character/45",…],
// "url": "https://rickandmortyapi.com/api/location/1",
// "created": "2017-11-10T12:42:04.162Z"
// },

class Location {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;

  Location(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required this.created,
      required this.residents,
      required this.url});
}
