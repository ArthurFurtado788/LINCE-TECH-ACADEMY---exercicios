import 'dart:math';

void main() {
  final random = Random();
  final List<int> lista = [];

  for (var i =0; i < 50; i++) {
    lista.add(random.nextInt(12) + 10);
  }

  print("Lista original: ${lista.join(" ; ")}");

  final Set<int> unicos = lista.toSet();

  print("Itens únicos: ${unicos.join(" ; ")}");
}