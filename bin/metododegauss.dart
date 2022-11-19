//import "dart:io";
int num_col = 6;
int num_lin = 5;
void main(List<String> arguments) {
  

  List<List<double>> matriz = [
    [2, 4, 6, 2, 4, 6],
    [1, 2, -1, 3, 8, 4],
    [-3, 1, -2, 1, -2, 9],
    [1, 3, -3, -2, 6, 2],
    [3, 7, 2, 1, 4, 10]
  ];

  print('======================== MATRIZ ORIGINAL =========================');
  printMatrix(matriz);
  print('\n');
  print('======================== PROCESSO DE ESCALONAMENTO =========================');
  gauss(matriz);
  print('\n');
  substituicaoReversa(matriz);
}

void printMatrix(List<List<double>> matriz){
  
  for(int i = 0; i < num_lin; i++){
    for(int j = 0; j < num_col; j++){
      stdout.write('\t${matriz[i][j]}');
    }
    print('\n');
  }
}

void gauss(List<List<double>> matriz){
  for(int j = 0; j < num_col - 2; j++){
    for(int i = j; i < num_lin; i++){
      if(matriz[i][j] != 0){
        if (i != j){
          for(int k = 0; k < num_col; k++){
            double temp = matriz[i][k];
            matriz[i][k] = matriz[j][k];
            matriz[j][k] = temp;
          }
        }
        for(int m = j + 1; m < num_lin; m++){
          double a = -matriz[m][j] / matriz[j][j];
          for(int n = j; n < num_col; n++){
            matriz[m][n] += a * matriz[j][n];
          }
        }
        printMatrix(matriz);
        print('\n');
        break;
      }
    }
  }
}

void substituicaoReversa(List<List<double>> matriz){
  int d = num_lin - 1;
  List<double> temp = [0, 0, 0, 0, 0];
  for(int i = 0; i < num_lin; i++){
    int j = d - i;
    var soma = matriz[j][num_col - 1];
    for(int k = j + 1; k < num_col - 1; k++){
      soma -= matriz[j][k] * temp[k];
    }
    soma /= matriz[j][j];
    var somaFormatado = soma.toStringAsFixed(2);
    print('x${j + 1} = $somaFormatado');
    temp[j] = soma;
  }
}