class Grammar {
  int? id;
  String? nameJP;
  String? nameVN;

  Grammar({
    this.id,
    this.nameJP,
    this.nameVN,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameJP': nameJP,
      'nameVN': nameVN,
    };
  }
}
