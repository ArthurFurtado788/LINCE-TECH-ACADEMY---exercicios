void main() {
  Map<String, int?> pessoas = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31,
  };
 
  pessoas.forEach((nome, idade) {
    print('$nome - ${idade?.toString() ?? 'idade nao informada'}');
  });
}