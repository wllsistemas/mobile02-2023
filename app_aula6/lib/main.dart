void main() {
  // 1- valor será conhecido em tempo de execução
  // 2- consome menos memória
  // 3- atribuição pode ser posterior
  // 4- objetos podem sofrer mutação
  final List numeros = [5, 7, 20];
  numeros.add(55);
  print(numeros);
}
