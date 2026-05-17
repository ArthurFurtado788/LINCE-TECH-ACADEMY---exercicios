// 4. Monte um algoritmo que receba dois números inteiros, e imprima o menor múltiplo comum entre eles.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os números inteiros (entrada de dados)
  print('Informe o primeiro número inteiro:');
  // Tipo de dado + leitura.
  int a = int.parse(stdin.readLineSync()!);
  print('Informe o segundo número inteiro:');
  int b = int.parse(stdin.readLineSync()!);

  // Lógica de validação -> se algum dos dados da entrada for 0, mostra erro e encerra a execução.
  if (a == 0 || b == 0) {
    print('Erro: nenhum dos valores pode ser zero!');
    return;
  }

  // Converte para valores positivos caso algum seja negativo
  a = a.abs();
  b = b.abs();

  // Guarda os valores originais para usar no cálculo do MMC
  int original1 = a;
  int original2 = b;

  // Cálculo do MDC -> máximo divisor comum (Algoritmo de Euclides)
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }

  // Cálculo do MMC -> mínimo múltiplo comum
  int mdc = a;
  int mmc = (original1 * original2) ~/ mdc;
  print('O MMC é: $mmc');
}
