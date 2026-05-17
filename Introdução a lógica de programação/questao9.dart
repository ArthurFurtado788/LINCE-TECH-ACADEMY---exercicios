/* 9. Implemente um algoritmo que dado um texto, e imprima: 
  a) A quantidade de vogais 
  b) A quantidade de consoantes 
  c) A quantidade total de letras 
  d) A quantidade de palavras */

// Importei a biblioteca auxiliar do DART para gerenciamento de dados (input e output).
import 'dart:io';

// Função principal do programa.
void main() {
  // Solicito ao usuário que informe o texto (entrada de dados).
  print('Informe um texto:');
  // Tipo de dado + leitura.
  String texto = stdin.readLineSync()!;

  // Contadores
  int vogais = 0;
  int consoantes = 0;
  int totalLetras = 0;
  int palavras = texto.isEmpty
      ? 0
      : 1; // validação para texto vazio, no caso, palavras = 0.

  // Método para percorrer cada caractere do texto informado pelo usuário e transformar em minúsculo.
  for (int i = 0; i < texto.length; i++) {
    String caractere = texto[i].toLowerCase();

    if (caractere == 'a' ||
        caractere == 'e' ||
        caractere == 'i' ||
        caractere == 'o' ||
        caractere == 'u') {
      vogais++; // a) contagem de vogais
      totalLetras++; // c) contagem total de letras
    } else if (caractere.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
        caractere.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
      consoantes++; // b) contagem de consoantes
      totalLetras++; // c) contagem total de letras
    } else if (caractere == ' ') {
      palavras++; // d) contagem de palavras
    }
  }

  // Mostra os resultados (saída de dados).
  print('Quantidade de vogais: $vogais'); // a)
  print('Quantidade de consoantes: $consoantes'); // b)
  print('Quantidade total de letras: $totalLetras'); // c)
  print('Quantidade de palavras: $palavras'); // d)
}
