/* 10. Implemente um algoritmo que receba uma sequência de X números e: 
  a) Imprima todos os números em ordem crescente 
  b) Imprima todos os números em ordem decrescente 
  c) Imprima o maior número
  d) Imprima o menor número 
  e) Imprima a soma dos números
  f) Imprima a média dos números 
  g) Imprima a soma dos números pares
  h) Imprima a soma dos números ímpares */

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito quantos números o usuário quer informar (entrada de dados).
  print('Quantos números deseja informar?');
  // Tipo de dado + leitura.
  int quantidade = int.parse(stdin.readLineSync()!);

  List<int> numeros = []; // Lista vazia para armazenar os números.

  // Método para ler cada número e adicionar à lista.
  for (int i = 0; i < quantidade; i++) {
    print('Informe o ${i + 1}º número:');
    int numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  // a) Ordem crescente
  List<int> crescente = List.from(numeros);
  crescente.sort();
  print('\na) Números em ordem crescente: $crescente');

  // b) Ordem decrescente
  List<int> decrescente = List.from(numeros);
  decrescente.sort((a, b) => b.compareTo(a));
  print('b) Números em ordem decrescente: $decrescente');

  // c) Maior número
  int maior = numeros.reduce((a, b) => a > b ? a : b);
  print('c) Maior número: $maior');

  // d) Menor número
  int menor = numeros.reduce((a, b) => a < b ? a : b);
  print('d) Menor número: $menor');

  // e) Soma dos números
  int soma = numeros.reduce((a, b) => a + b);
  print('e) Soma dos números: $soma');

  // f) Média dos números
  double media = soma / numeros.length;
  print('f) Média dos números: $media');

  // g) Soma dos números pares
  int somaPares = 0;
  for (int numero in numeros) {
    if (numero % 2 == 0) {
      somaPares += numero;
    }
  }
  print('g) Soma dos números pares: $somaPares');

  // h) Soma dos números ímpares
  int somaImpares = 0;
  for (int numero in numeros) {
    if (numero % 2 != 0) {
      somaImpares += numero;
    }
  }
  print('h) Soma dos números ímpares: $somaImpares');
}
