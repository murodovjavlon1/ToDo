class RejaModel {
  final String id;
  final String nomi;
  final DateTime kuni;
  bool bajarildi = false;

  RejaModel({
    required this.nomi,
    required this.kuni,
    required this.id,
  });

  void bajarildiniUzgartirish() {
    bajarildi = !bajarildi;
  }
}

class RejalarR {
  // _ private | shaxsiy
  final List<RejaModel> _ruyxat = [
    RejaModel(nomi: "Bozorga borish ", kuni: DateTime.now(), id: "n1"),
    RejaModel(nomi: "Ishlash ", kuni: DateTime.now(), id: "n2"),
    RejaModel(nomi: "uynash  ", kuni: DateTime.now(), id: "n3"),
    RejaModel(nomi: "borish  ", kuni: DateTime.now(), id: "n4"),
  ];
 List <RejaModel> get ruyxat{
  return _ruyxat;
 }
  
}
