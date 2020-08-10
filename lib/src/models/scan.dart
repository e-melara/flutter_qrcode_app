class Scan {
  int id;
  String tipo;
  String valor;

  Scan({this.id, this.tipo, this.valor}) {
    if (this.valor.contains('http')) {
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }

  factory Scan.fromJson(Map<String, dynamic> json) {
    return new Scan(
      id: json['id'],
      tipo: json['tipo'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'tipo': this.tipo,
      'valor': this.valor,
    };
  }
}
