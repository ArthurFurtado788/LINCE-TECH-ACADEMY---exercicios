// 7. Implemente um algoritmo que receba um número decimal, e imprima seu valor fatorial (cálculo fatorial).

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe o número inteiro (entrada de dados)
  print('Informe um número inteiro:');
  // Tipo de dado + leitura.
  int numero = int.parse(stdin.readLineSync()!);

  // Lógica de validação -> se o número for negativo, mostra erro e encerra a execução.
  if (numero < 0) {
    print('Erro: o número não pode ser negativo!');
    return;
  }

  // Cálculo do fatorial
  int fatorial = 1;

  for (int i = 1; i <= numero; i++) {
    fatorial *= i;
  }

  // Mostra o resultado (saída de dados)
  print('O fatorial de $numero é $fatorial');
}
