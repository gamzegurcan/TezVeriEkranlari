class Yemekler {
  String yemek_id;
  String Yemek_adi;
  int Suresi;
  int star_rate;
  String star_counter;
  String star_total;
  String resim;
  String kategori_ad;
  String Tarif;
  String Malzemesi;

  Yemekler(
      this.yemek_id,
      this.Yemek_adi,
      this.Suresi,
      this.resim,
      this.kategori_ad,
      this.Tarif,
      this.Malzemesi,
      this.star_counter,
      this.star_rate,
      this.star_total);

  factory Yemekler.fromJson(String key, Map<dynamic, dynamic> json) {
    return Yemekler(
      key,
      json["Yemek_adi"] as String,
      json["Suresi"] as int,
      json["resim"] as String,
      json["kategori_ad"] as String,
      json["Tarif"] as String,
      json["Malzemesi"] as String,
      json["star_counter"] as String,
      json["star_rate"] as String,
      json["star_rate"] as String,
    );
  }
}
