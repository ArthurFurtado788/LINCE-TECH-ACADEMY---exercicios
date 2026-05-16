// 3. Monte um algoritmo que receba dois números, realize a subtração entre eles e retorne o valor absoluto (positivo) da operação.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os números (entrada de dados)
  print('Informe o primeiro número:');
  // Tipo de dado + leitura.
  int num1 = int.parse(stdin.readLineSync()!);
  print('Informe o segundo número:');
  int num2 = int.parse(stdin.readLineSync()!);

  // Comparação e subtração dos dados
  int resultado;
  // Quando número 1 for maior
  if (num1 < num2) {
    resultado = num2 - num1;
    // Quando número 2 for maior
  } else {
    resultado = num1 - num2;
  }
  // Mostra o resultado (saída de dados)
  print('O resultado é: $resultado');
}
