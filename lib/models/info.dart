// "count": 126,
// "pages": 7,
// "next": "https://rickandmortyapi.com/api/location?page=2",
// "prev": null

class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info({required this.count, required this.pages, this.next, this.prev});
}
