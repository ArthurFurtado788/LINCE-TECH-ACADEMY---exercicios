import 'dart:math';

void main() {
  final random = Random();
  final a = random.nextInt(100) + 1; // gera entre 1 e 100
  final b = random.nextInt(100) + 1;

  final resultado1 = (a / b);
  final resultadoInteiro = (resultado1.truncate());
  final resultadoDecimal = (resultado1 - resultado1.truncate());

  print("""
  Variável 1 - Número aleatório: ${a};
  Variável 2 - Número aleatório: ${b};
  Varíavel 3 - Resultado divisão: ${resultado1.toStringAsFixed(2)};
  Variável 4 - Parte inteira: ${resultadoInteiro};
  Varíavel 5 - Parte decimal: ${resultadoDecimal.toStringAsFixed(2)};
  """);
}