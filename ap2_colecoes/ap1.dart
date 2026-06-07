import 'dart:math';

void main() {
  final random = Random();
  final List<int> lista = [];

  for (var i = 0; i < 10; i++) {
    lista.add(random.nextInt(101));
  }

  for (var i = 0; i < lista.length; i++) {
    print("Posição: $i, valor: ${lista[i]}");
  }
}