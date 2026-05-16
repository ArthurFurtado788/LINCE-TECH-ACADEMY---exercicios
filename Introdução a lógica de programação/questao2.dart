// 2. Monte um algoritmo que receba 5 números, e imprima todos os números ímpares recebidos.

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // LOOP for para ler e verificar cada número informado, tendo como número de repetições, 5.
  for (int i = 1; i <= 5; i++) {
    // Solicita o número ao usuário (ENTRADA DE DADOS).
    print('Informe um número:');
    // Tipo de dado + leitura.
    int numero = int.parse(stdin.readLineSync()!);
    // Resto de divisão para validar se o número é ímpar.
    if (numero % 2 != 0) {
      print('NÚMERO ÍMPAR DETECTADO: $numero');
    }
  }
}
