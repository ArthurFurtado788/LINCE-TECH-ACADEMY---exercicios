List<int> converterParaNumeros(List<String> textos) {
  return textos.map((texto) => int.tryParse(texto) ?? 0).toList();
}

void main() {
  List<String> valores = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78',
  ];
 
  List<int> convertidos = converterParaNumeros(valores);
 
  print('Lista convertida: ${convertidos.join(', ')}');
}