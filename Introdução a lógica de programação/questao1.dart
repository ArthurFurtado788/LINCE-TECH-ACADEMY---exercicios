// 1. Monte um algoritmo que receba dois números decimais, e dívida o maior número pelo menor número.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os números decimais (entrada de dados)
  print('Informe o primeiro número decimal:');
  // Tipo de dado + leitura.
  double num1 = double.parse(stdin.readLineSync()!);

  print('Informe o segundo número decimal:');
  double num2 = double.parse(stdin.readLineSync()!);

  // Lógica de validação -> se algum dos dados da entrada for 0, mostra erro e encerra a execução.
  if (num1 == 0 || num2 == 0) {
    print('Erro: não é possível dividir por zero!');
    return;
  }

  // Comparação e divisão dos dados
  double resultado;
  // Quando número 1 for maior
  if (num1 > num2) {
    resultado = num1 / num2;
    // Quando número 2 for maior
  } else if (num2 > num1) {
    resultado = num2 / num1;
    // Quando os números forem iguais
  } else {
    resultado = num1 / num2;
  }
  // Mostra o resultado (saída de dados)
  print('O resultado é: $resultado');
}
