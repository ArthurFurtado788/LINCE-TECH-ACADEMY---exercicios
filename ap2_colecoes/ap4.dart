void main() {
  final Map<String, List<String>> cidades = { // Mapa Chave/Valor com lista
    'SC': ['Gaspar', 'Blumenau', 'Florianopolis'],
    'PR': ['Curitiba', 'Cascavel', 'Foz do Iguaçu'],
    'SP': ['Sao Paulo', 'Guarulhos', 'Campinas'],
    'MG': ['Belo Horizonte', 'Juiz de Fora', 'Berlinda']
  };

  print("Estados: ${cidades.keys.join(' ; ')}"); // primeiro print ( lista de estados )

  final cidadesSC = cidades['SC'] ?? []; // segurança
  cidadesSC.sort(); // ordena alfabeticamente

  print("Cidades de SC: ${cidadesSC.join(' ; ')}");

  final List<String> todasCidades = []; // cria uma lista com todas as informações

  cidades.forEach((estado, listaCidades) { // percorre o mapa e adiciona cada cidade com seu estado
    for (var cidade in listaCidades) {
      todasCidades.add('$cidade - $estado');
    }
  });

  todasCidades.sort();  // método para impressão da lista completa conforme pedido 
  for (var item in todasCidades) {
    print(item);
  }
}