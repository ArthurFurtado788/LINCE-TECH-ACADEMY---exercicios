import 'dart:math';

void main() {
  final random = Random();
  final a = random.nextInt(100) + 1; // gera entre 1 e 100
  final b = random.nextInt(100) + 1;
  var temp = a; // variável temporária para guardar 'a' antes de perder o valor original

  // print antes de inverter os valores
  print("Antes: a = ${a} , b = ${b}");

  // inversão dos valores
  a = b;
  b = temp;

  // print dos valores invertidos
  print("Depois: a = ${a} , b = ${b}");
}