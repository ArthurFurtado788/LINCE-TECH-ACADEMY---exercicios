int calcularPercentualDesconto(double valorOriginal, double valorComDesconto) {
  return ((valorOriginal - valorComDesconto) / valorOriginal * 100).round();
}
 
void main() {
  double valorOriginal = 10;
  double valorComDesconto = 7;
 
  int percentual = calcularPercentualDesconto(valorOriginal, valorComDesconto);
 
  print(
    'O produto custava ${valorOriginal.toInt()} reais, '
    'foi vendido por ${valorComDesconto.toInt()} reais. '
    'O desconto dado foi $percentual%.',
  );
}