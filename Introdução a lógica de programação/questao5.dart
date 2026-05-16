// 5. Implemente um algoritmo que realize os cálculos da fórmula de Bhaskara e imprima os valores de X.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';
// Eu importaria dart:math, mas optei por não usar para que não haja conflito com as regras para realização dos exercícios.

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os números (entrada de dados)
  print('Informe o valor de A:');
  // Tipo de dado + leitura.
  double a = double.parse(stdin.readLineSync()!);
  print('Informe o valor de B:');
  double b = double.parse(stdin.readLineSync()!);
  print('Informe o valor de C:');
  double c = double.parse(stdin.readLineSync()!);

  // Lógica de validação -> se o dado da entrada de A for 0, mostra erro e encerra a execução.
  if (a == 0) {
    print('Erro: o valor de A não pode ser zero!');
    return;
  }

  // Cálculo do DELTA de acordo com a fórmula de Bhaskara.
  double delta = (b * b) - (4 * a * c);

  // Verificação do DELTA
  // Quando delta é menor que zero, não há raízes reais.
  if (delta < 0) {
    print('Não há raízes reais.');

    // Quando delta é igual a zero, há apenas uma raiz real.
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('A única raiz é: $x');
    // Quando delta é maior que zero, há duas raízes reais.
  } else {
    // Cálculo da raiz quadrada do delta pelo método de Newton
    double estimativa = delta / 2;
    while (true) {
      // Refinamento da estimativa a cada iteração
      double novaEstimativa = (estimativa + (delta / estimativa)) / 2;
      // Para quando a precisão for suficiente
      if (estimativa - novaEstimativa < 0.00001 &&
          novaEstimativa - estimativa < 0.00001) {
        break;
      }
      estimativa = novaEstimativa;
    }
    // Raiz quadrada do delta encontrada
    double raizDelta = estimativa;
    // Cálculo das duas raízes de X
    double x1 = (-b + raizDelta) / (2 * a);
    double x2 = (-b - raizDelta) / (2 * a);
    // Impressão dos resultados (saída de dados)
    print('X1 = $x1');
    print('X2 = $x2');
  }
}
