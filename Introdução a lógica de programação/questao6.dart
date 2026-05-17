// 6. Implemente um algoritmo que receba as medidas dos catetos de um triangulo retângulo, e imprima o valor da hipotenusa (teorema de Pitágoras).

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';
// Importei a biblioteca auxiliar do DART para operações matemáticas.
import 'dart:math';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe os catetos do triângulo retângulo (entrada de dados)
  print('Informe a medida do primeiro cateto:');
  // Tipo de dado + leitura.
  double cateto1 = double.parse(stdin.readLineSync()!);

  print('Informe a medida do segundo cateto:');
  double cateto2 = double.parse(stdin.readLineSync()!);

  // Lógica de validação -> se algum dos dados da entrada for 0, mostra erro e encerra a execução.
  if (cateto1 == 0 || cateto2 == 0) {
    print('Erro: nenhum dos valores pode ser zero!');
    return;
  }

  // Calculo da soma dos quadrados dos catetos
  double somaDosQuadrados = (cateto1 * cateto1) + (cateto2 * cateto2);
  // Calcula a raiz quadrada da soma -> essa é a hipotenusa
  double hipotenusa = sqrt(somaDosQuadrados);
  // Mostra o resultado (saída de dados)
  print('O valor da hipotenusa é: $hipotenusa');
}
