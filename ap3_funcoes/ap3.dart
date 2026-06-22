import 'dart:math';

// Função para calcular a área do círculo
double calcularArea(int raio) {
  return pi * (raio * raio);
}

// Função para calcular o perímetro do círculo
double calcularPerimetro(int raio) {
  return 2 * pi * raio;
}

void main() {
  Random random = Random();

  // Inicializa a lista com 10 números aleatórios entre 1 e 100
  // nextInt(100) gera de 0 a 99, somando + 1 fica de 1 a 100
  List<int> raios = List.generate(10, (_) => random.nextInt(100) + 1);

  // Passa por cada raio da lista, calcula e imprime no console
  for (int raio in raios) {
    double area = calcularArea(raio);
    double perimetro = calcularPerimetro(raio);

    
    print(
      'Raio: $raio, área: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}'
    );
  }
}