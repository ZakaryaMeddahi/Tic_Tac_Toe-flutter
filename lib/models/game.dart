import './player.dart';

class Game {
  Player p1 = Player('palyer 1', 'X', 0);
  Player p2 = Player('palyer 2', 'O', 0);
  List<List<int>> matrix = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  int numberOfRounds = 0;
  String tour = 'p1';
  // bool isGameEnded = false;

  void initializeRound() {
    matrix = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ];
  }

  void initializeGame() {
    initializeRound();
    p1.setScore(0);
    p2.setScore(0);
    tour = 'p1';
  }

  void newGame() {
    initializeGame();
    p1.setName('Player 1');
    p2.setName('Player 2');
  }

  String gameResult() {
    int lineSum = 0;
    int columnSum = 0;
    int firstDiamater = 0;
    int secondDiamater = 0;

    // get the sum of lines, columns, and two diagrams of the square
    for (int i = 0, k = 2; i < 3; i++, k--) {
      lineSum = 0;
      columnSum = 0;

      for (int j = 0; j < 3; j++) {
        lineSum += matrix[i][j];
        columnSum += matrix[j][i];
      }

      if (lineSum == 3 || columnSum == 3 || lineSum == -3 || columnSum == -3) {
        break;
      }

      firstDiamater += matrix[i][i];
      print('first Diamater: ' + firstDiamater.toString());
      print("matrix[i][i]: " + matrix[i][i].toString());
      secondDiamater += matrix[i][k];
    }

    // start next round when one of the players win
    return getRoundResult(lineSum, columnSum, firstDiamater, secondDiamater);
  }

  String getRoundResult(int lSum, int cSum, int fDiamater, int sDiamater) {
    if (lSum == 3 || cSum == 3 || fDiamater == 3 || sDiamater == 3) {
      numberOfRounds++;
      p1.setScore(p1.getScore() + 1);
      initializeRound();
      return 'p1Win';
    } else if (lSum == -3 || cSum == -3 || fDiamater == -3 || sDiamater == -3) {
      numberOfRounds++;
      p2.setScore(p2.getScore() + 1);
      initializeRound();
      return 'p2Win';
    } else if (!isMatrixEmpty()) {
      numberOfRounds++;
      p1.setScore(p1.getScore() + 1);
      p2.setScore(p2.getScore() + 1);
      initializeRound();
      return 'draw';
    }

    return '';
  }

  bool isMatrixEmpty() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (matrix[i][j] == 0) {
          return true;
        }
      }
    }

    print('false');

    return false;
  }

  // get maximum value from array
  // int max(List<int> arr) {
  //   int max = -99999999;

  //   for (int i = 0; i < arr.length; i++) {
  //     if (arr[i] > max) {
  //       max = arr[i];
  //     }
  //   }
  //   print(max);
  //   return max;
  // }

  // get minimum value from array
  // int min(List<int> arr) {
  //   int min = 99999999;

  //   for (int i = 0; i < arr.length; i++) {
  //     if (arr[i] > min) {
  //       min = arr[i];
  //     }
  //   }
  //   print(min);
  //   return min;
  // }

  // switch tours between players
  void updateBoxState(int lineNumber, int columnNumber) {
    if (matrix[lineNumber][columnNumber] == 0) {
      if (tour == 'p1') {
        // matrix[lineNumber][columnNumber] = 'X';
        matrix[lineNumber][columnNumber] = 1;
        tour = 'p2';
      } else {
        // matrix[lineNumber][columnNumber] = 'O';
        matrix[lineNumber][columnNumber] = -1;
        tour = 'p1';
      }
    }
  }

  bool isGameEnded() {
    if (numberOfRounds == 3) {
      return true;
    }
    return false;
  }

  String endGame() {
    if (isGameEnded()) {
      if (p1.getScore() > p2.getScore()) {
        return p1.getName() + " Wins";
      } else {
        return p2.getName() + " Wins";
      }
    }

    return '';
  }

  String displayXO(int LineNumber, int columnNumber) {
    if (matrix[LineNumber][columnNumber] == 1) {
      return 'X';
    } else if (matrix[LineNumber][columnNumber] == -1) {
      return 'O';
    }

    return ' ';
  }
}
