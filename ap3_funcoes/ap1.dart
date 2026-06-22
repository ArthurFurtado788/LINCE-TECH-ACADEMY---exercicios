import 'dart:math';

// Função para imprimir uma lista no formato exigido
void imprimirLista(List<int> lista) {
  if (lista.isEmpty) {
    print('Lista vazia');
  } else {
    // O .join(', ') junta os números com vírgula e espaço
    print('Lista: ${lista.join(", ")}');
  }
}

// Função para somar as duas listas e mostrar as ações no console
List<int> somarListas(List<int> listaA, List<int> listaB) {
  // Validação do bônus: Se os tamanhos forem diferentes, retorna vazia
  if (listaA.length != listaB.length) {
    return [];
  }

  List<int> resultado = [];

  // Passa por cada índice para somar os números correspondentes
  for (int i = 0; i < listaA.length; i++) {
    print('${listaA[i]}+${listaB[i]}'); // Printa a ação
    resultado.add(listaA[i] + listaB[i]); // Adiciona o resultado da soma
  }

  return resultado;
}
void main() {
  Random random = Random();

  // Cria as duas listas com 4 números aleatórios entre 0 e 100
  List<int> lista1 = List.generate(4, (_) => random.nextInt(101));
  List<int> lista2 = List.generate(4, (_) => random.nextInt(101));

  // Imprime a Lista 1 e a Lista 2 uma embaixo da outra
  imprimirLista(lista1);
  imprimirLista(lista2);

  // Faz as somas e mostra as ações
  List<int> listaFinal = somarListas(lista1, lista2);

  // Imprime a lista com o resultado final
  imprimirLista(listaFinal);
}