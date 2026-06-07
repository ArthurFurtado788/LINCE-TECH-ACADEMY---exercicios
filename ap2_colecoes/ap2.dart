import 'dart:math';

void main() {
  final random = Random();
  final List<int> lista = [];

  for (var i =0; i < 50; i++) {
    lista.add(random.nextInt(16));
  }

  print("Lista original: ${lista.join(' ; ')}");

  lista.removeWhere((numero) => numero % 2 == 0);

  print("Lista atualizada: ${lista.join(' ; ')}");
}