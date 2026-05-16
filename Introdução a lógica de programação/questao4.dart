// 4. Monte um algoritmo que receba dois números decimais, e imprima o menor múltiplo comum entre eles.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os números decimais (entrada de dados)
  print('Informe o primeiro número decimal:');
  // Tipo de dado + leitura.
  double a = double.parse(stdin.readLineSync()!);
  print('Informe o segundo número decimal:');
  double b = double.parse(stdin.readLineSync()!);

  // Lógica de validação -> se algum dos dados da entrada for 0, mostra erro e encerra a execução.
  if (a == 0 || b == 0) {
    print('Erro: não é possível dividir por zero!');
    return;
  }

  // Guarda os valores originais para usar no calculo do MMC
  double original1 = a;
  double original2 = b;

  // Calculo do MDC -> máximo divisor comum
  while (b != 0) {
    double temp = b;
    b = a % b;
    a = temp;
  }

  // Calculo do MMC -> mínimo múltiplo comum
  double mdc = a;
  double mmc = (original1 * original2) / mdc;
  print('O MMC é: $mmc');
}
