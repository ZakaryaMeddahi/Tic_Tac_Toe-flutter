import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_o_game/models/game.dart';

class Box extends StatefulWidget {
  const Box({super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
//   int p1Score = 0;
//   int p2Score = 0;
//   String tour = 'p1';
//   String winner = '';
//   bool stopGame = false;
//   // List<List<String>> matrix = [
//   //   [' ', ' ', ' '],
//   //   [' ', ' ', ' '],
//   //   [' ', ' ', ' ']
//   // ];

//   List<List<int>> resultMatrix = [
//     [0, 0, 0],
//     [0, 0, 0],
//     [0, 0, 0]
//   ];

//   void initializeMatrix() {
//     // matrix = [
//     //   [' ', ' ', ' '],
//     //   [' ', ' ', ' '],
//     //   [' ', ' ', ' ']
//     // ];

//     resultMatrix = [
//       [0, 0, 0],
//       [0, 0, 0],
//       [0, 0, 0]
//     ];
//   }

//   // switch tours between players
//   void updateBoxState(int lineNumber, int columnNumber) {
//     setState(() {
//       if (resultMatrix[lineNumber][columnNumber] == 0) {
//         if (tour == 'p1') {
//           // matrix[lineNumber][columnNumber] = 'X';
//           resultMatrix[lineNumber][columnNumber] = 1;
//           tour = 'p2';
//         } else {
//           // matrix[lineNumber][columnNumber] = 'O';
//           resultMatrix[lineNumber][columnNumber] = -1;
//           tour = 'p1';
//         }
//       }
//     });
//   }

//   void gameResult() {
//     int lineSum = 0;
//     int columnSum = 0;
//     int firstDiamater = 0;
//     int secondDiamater = 0;

//     // get the sum of lines, columns, and two diagrams of the square
//     for (int i = 0, k = 2; i < 3; i++, k--) {
//       lineSum = 0;
//       columnSum = 0;

//       for (int j = 0; j < 3; j++) {
//         lineSum += resultMatrix[i][j];
//         columnSum += resultMatrix[j][i];
//       }

//       if (max([lineSum, columnSum]) == 3 || min([lineSum, columnSum]) == -3) {
//         break;
//       }

//       firstDiamater += resultMatrix[i][i];
//       print('first Diamater: ' + firstDiamater.toString());
//       print("matrix[i][i]: " + resultMatrix[i][i].toString());
//       secondDiamater += resultMatrix[i][k];
//     }

//     // start next round when one of the players win
//     if (max([lineSum, columnSum, firstDiamater, secondDiamater]) == 3) {
//       stopGame = true;
//       winner = 'Player 1 Win';
//       print('player 1 win');
//     } else if (min([lineSum, columnSum, firstDiamater, secondDiamater]) == -3) {
//       stopGame = true;
//       winner = 'Player 2 Win';
//       print('player 2 win');
//     }
//   }

//   // get maximum value from array
//   int max(List<int> arr) {
//     int max = -99999999;

//     for (int i = 0; i < arr.length; i++) {
//       if (arr[i] > max) {
//         max = arr[i];
//       }
//     }
//     print(max);
//     return max;
//   }

// // get minimum value from array
//   int min(List<int> arr) {
//     int min = 99999999;

//     for (int i = 0; i < arr.length; i++) {
//       if (arr[i] < min) {
//         min = arr[i];
//       }
//     }
//     print(min);
//     return min;
//   }

//   // return X for player 1 and O for player 2
//   String displayXO(int LineNumber, int columnNumber) {
//     if (resultMatrix[LineNumber][columnNumber] == 1) {
//       return 'X';
//     } else if (resultMatrix[LineNumber][columnNumber] == -1) {
//       return 'O';
//     }

//     return ' ';
//   }

  // void gameOver() {
  //   int line = 0;
  //   int column = 3;
  //   bool incrementP1LineScore = false;
  //   bool incrementP2LineScore = false;

  //   for (int line = 0; line < 3; line++) {
  //     if (matrix[line][line] != ' ') {
  //       if (matrix[line][line] == 'X') {
  //         p1Score++;
  //       } else {
  //         p2Score++;
  //       }
  //     }

  //     if (matrix[line][column--] == 'X') {
  //       p1Score++;
  //     } else {
  //       p2Score++;
  //     }

  //     for (int i = 0; i < 3; i++) {
  //       p1Score = 0;
  //       p2Score = 0;
  //       for (int j = 0; j < 3; j++) {
  //         if (matrix[i][j] == 'X') {
  //           incrementP1LineScore = true;
  //         }

  //         if (matrix[j][i] == 'X') {
  //           p1Score++;
  //         }
  //       }
  //     }
  //   }

  //   if (p1Score == 3) {
  //     print('Player 1 wins');
  //   } else if (p2Score == 3) {
  //     print('Player 2 wins');
  //   }
  // }

  Game game = Game();
  String roundWinner = '';
  String gameWinner = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(width: 35),
              Column(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'X',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 38),
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 70),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    game.p1.getName(),
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  )
                ],
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  game.p1.getScore().toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 38), fontSize: 30),
                ),
              ),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  game.p2.getScore().toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 38), fontSize: 30),
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'O',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 38),
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 70),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    game.p2.getName(),
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  )
                ],
              ),
              SizedBox(width: 35)
            ],
          ),
        ),

        // Text(
        //   gameWinner,
        //   style: const TextStyle(
        //       color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        // ),
        // Text(
        //   roundWinner,
        //   style: const TextStyle(
        //       color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 50),
        Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 38),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                child: Column(
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (game.isGameEnded() == false) {
                              game.updateBoxState(0, 0);
                              roundWinner = game.gameResult();
                              gameWinner = game.endGame();
                            }

                            if (game.isGameEnded() == true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Game Over'),
                                    content: Text(gameWinner),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      )
                                    ]
                                  );
                                }
                              );
                            }
                          });
                        },
                        child: Container(
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10))),
                          child: Text(
                            game.displayXO(0, 0),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(0, 1);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          child: Text(
                            game.displayXO(0, 1),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(0, 2);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10))),
                          child: Text(
                            game.displayXO(0, 2),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(1, 0);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          child: Text(
                            game.displayXO(1, 0),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(1, 1);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          child: Text(
                            game.displayXO(1, 1),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(1, 2);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          child: Text(
                            game.displayXO(1, 2),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(2, 0);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10))),
                          child: Text(
                            game.displayXO(2, 0),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(2, 1);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          child: Text(
                            game.displayXO(2, 1),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            game.updateBoxState(2, 2);
                            roundWinner = game.gameResult();
                            gameWinner = game.endGame();
                          });
                        },
                        child: Container(
                          width: 76,
                          height: 76,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Text(
                            game.displayXO(2, 2),
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                game.initializeRound();
              });
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                minimumSize: MaterialStatePropertyAll(Size(120, 40))),
            child: const Text('Replay'))
      ],
    );
  }
}
