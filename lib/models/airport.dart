class Airport{
  int id;
  String iataCode;
  String icaoCode;
  String name;
  String location; // Coordinates
  String municipality;

  Airport({
    required this.id,
    required this.iataCode,
    required this.icaoCode,
    required this.name,
    required this.location,
    required this.municipality,
  });
}