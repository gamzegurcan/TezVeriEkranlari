
class Yemekler {
  String yemek_id;
  String Yemek_adi;
  int Suresi;
  String resim;
  String kategori_ad;
  String Tarif;
  String Malzemesi;

  Yemekler(this.yemek_id, this.Yemek_adi, this.Suresi, this.resim,
      this.kategori_ad, this.Tarif, this.Malzemesi);

  factory Yemekler.fromJson(String key, Map<dynamic, dynamic> json) {
    return Yemekler(
        key,
        json["Yemek_adi"] as String,
        json["Suresi"] as int,
        json["resim"] as String,
        json["kategori_ad"] as String,
        json["Tarif"] as String,
        json["Malzemesi"] as String);
  }
}
