class RecentlyPlayedModel {
  final String title;
  final String image;
  final String text;

  RecentlyPlayedModel({
    required this.title,
    required this.image,
    required this.text,
  });
}

List<RecentlyPlayedModel> recentlyPlayed = [
  RecentlyPlayedModel(
    title: "Episode 334",
    image: "assets/images/mqdefault_6s-18.png",
    text:
        "The wife, Tbo Touch, Travel Swindler, Zola 7, Funeral Etiquette, Fiesta Black, DJ Ganyani",
  ),
  RecentlyPlayedModel(
    title: "Episode 331",
    image: "assets/images/mqdefault_6s-12.png",
    text:
        "The wife, Tbo Touch, Travel Swindler, Zola 7, Funeral Etiquette, Fiesta Black, DJ Ganyani",
  ),
  RecentlyPlayedModel(
    title: "Episode 337",
    image: "assets/images/mqdefault_6s-9.png",
    text:
        "The wife, Tbo Touch, Travel Swindler, Zola 7, Funeral Etiquette, Fiesta Black, DJ Ganyani",
  ),
];
