// "id": 1,
// "name": "Pilot",
// "air_date": "December 2, 2013",
// "episode": "S01E01",
// "characters":["https://rickandmortyapi.com/api/character/1", "https://rickandmortyapi.com/api/character/2",…],
// "url": "https://rickandmortyapi.com/api/episode/1",
// "created": "2017-11-10T12:56:33.798Z"

class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<dynamic> characters;
  String url;
  String created;

  Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.characters,
      required this.episode,
      required this.created,
      required this.url});
}
