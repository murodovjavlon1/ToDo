class RejaModel {
  final String id;
  final String nomi;
  final String kuni;
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
    RejaModel(nomi: "Bozorga borish ", id: "n1", kuni: "${DateTime.now()}"),
    RejaModel(nomi: "Ishlash ", id: "n2", kuni:"${DateTime.now()}"),
    RejaModel(nomi: "uynash  ", id: "n3", kuni: "${DateTime.now()}"),
  ];
  List<RejaModel> get ruyxat {
    return _ruyxat;
  }

  void addToDo(String rejaNomi, String rejaKuni) {
    _ruyxat.add(RejaModel(
        nomi: rejaNomi, kuni: rejaKuni, id: "r${_ruyxat.length + 1}"));
  }

  // void addTodo(
  //   String rejaKun,
  //   String rejaNomi,
  // ) {
  //   _ruyxat.add(RejaModel(
  //     nomi: rejaNomi,
  //     kuni: DateTime.now(),
  //     id: "r${_ruyxat.length + 1}",
  //   ));
  // }
}
