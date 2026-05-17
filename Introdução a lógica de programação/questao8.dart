// 8. Implemente um algoritmo que receba um número X, e imprima sua multiplicação de 1 até 9 (tabuada).

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe o número inteiro (entrada de dados)
  print('Informe um número inteiro:');
  // Tipo de dado + leitura.
  int numero = int.parse(stdin.readLineSync()!);

  // Cálculo da tabuada
  for (int i = 1; i <= 9; i++) {
    int resultado = numero * i;
    print('$numero x $i = $resultado');
  }
}
