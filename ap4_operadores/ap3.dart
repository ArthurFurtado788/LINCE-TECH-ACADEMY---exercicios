List<A> removerDaLista<A>(List<A>? lista, A? elemento) {
  final List<A> listaSegura = lista ?? <A>[];
  listaSegura.remove(elemento);
  return listaSegura;
}
 
void main() {
  List<int> numeros = [1, 2, 3, 4, 5];
 
  print('Lista original: $numeros');
 
  // Caso 1: lista e elemento válidos
  print('Removendo o 3: ${removerDaLista(numeros, 3)}');
 
  // Caso 2: elemento nulo
  print('Sem elemento informado: ${removerDaLista(numeros, null)}');
 
  // Caso 3: lista nula
  print('Sem lista informada: ${removerDaLista<int>(null, 3)}');
 
  // Caso 4: lista e elemento nulos
  print('Sem lista e sem elemento: ${removerDaLista<int>(null, null)}');
}