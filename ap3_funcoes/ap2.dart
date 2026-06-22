import 'dart:math';

// Função B: Recebe um número e faz uma operação
int funcaoB(int numero) {
  return numero * 2;
}

// Função C: Recebe um número e faz outra operação
int funcaoC(int numero) {
  return numero + 10;
}

// Função A: Recebe outra função como parâmetro
// O tipo 'Function' indica que ela aceita uma função
int funcaoA(Function funcaoParametro) {
  Random random = Random();

  // Sorteia dois números aleatórios entre 0 e 50
  int numero1 = random.nextInt(51);
  int numero2 = random.nextInt(51);

  // Executa a função recebida duas vezes, passando os números aleatórios
  int resultado1 = funcaoParametro(numero1);
  int resultado2 = funcaoParametro(numero2);

  // Retorna a soma dos dois resultados
  return resultado1 + resultado2;
}

void main() {
  // Executa a função A passando a função B como parâmetro
  int resultadoAB = funcaoA(funcaoB);

  // Executa a função A passando a função C como parâmetro
  int resultadoAC = funcaoA(funcaoC);

  // Imprime os resultados finais
  print('Resultado A(B): $resultadoAB');
  print('Resultado A(C): $resultadoAC');
}