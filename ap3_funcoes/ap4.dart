import 'dart:math';

// Função para converter para Binário
String converterBinario(int numero) {
  return numero.toRadixString(2);
}

// Função para converter para Octal
String converterOctal(int numero) {
  return numero.toRadixString(8);
}

// Função para converter para Hexadecimal
String converterHexadecimal(int numero) {
  return numero.toRadixString(16);
}

void main() {
  Random random = Random();

  // Inicializa a lista com 15 números aleatórios entre 1 e 5000
  List<int> numeros = List.generate(15, (_) => random.nextInt(5000) + 1);

  // Ordena a lista em ordem crescente antes de imprimir
  numeros.sort();

  // Passa pelos números ordenados, converte e imprime
  for (int numero in numeros) {
    String binario = converterBinario(numero);
    String octal = converterOctal(numero);
    String hexadecimal = converterHexadecimal(numero);

    print(
      'decimal: $numero, binário: $binario, octal: $octal, hexadecimal: $hexadecimal'
    );
  }
}