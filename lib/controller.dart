import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Represent the game board using a 2D list for easier readability
  final RxList<RxString> gameboard = [
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
    RxString(" "),
  ].obs;

  RxBool currentPlayer = true.obs; // Use true for 'X' and false for 'O'

  RxInt clickCount = 0.obs;
  final winConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void addValue(int index) {
    if (gameboard[index].value == " ") {
      gameboard[index].value = currentPlayer.value ? "X" : "O";
      currentPlayer.value = !currentPlayer.value; // Switch current player
      clickCount.value++;
      checkWinner();
      checkDraw(); // Added: Check for draw after each move
    } else {
      print("Invalid click");
    }
  }

  void checkWinner() {
    // Check all winning conditions using a loop for better readability

    for (var condition in winConditions) {
      final playerSymbol = gameboard[condition[0]].value;
      if (playerSymbol != " " &&
          playerSymbol == gameboard[condition[1]].value &&
          playerSymbol == gameboard[condition[2]].value) {
        showWinnerDialog(playerSymbol);
        return; // Exit the function after finding a winner
      }
    }
  }

  void checkDraw() {
    if (clickCount.value == 9 && !isWinner()) {
      showDrawDialog();
    }
  }

  bool isWinner() {
    // Refactored checkWinner logic into a separate function
    for (var condition in winConditions) {
      final playerSymbol = gameboard[condition[0]].value;
      if (playerSymbol != " " &&
          playerSymbol == gameboard[condition[1]].value &&
          playerSymbol == gameboard[condition[2]].value) {
        return true;
      }
    }
    return false;
  }

  void showWinnerDialog(String winner) {
    Get.defaultDialog(
      title: "Winner",
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      content: Column(
        children: [
          Icon(
            Icons.star_border_purple500,
            size: 50,
            color: Colors.green,
          ),
          SizedBox(height: 10),
          Text(
            "$winner is the Winner!",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  void showDrawDialog() {
    Get.defaultDialog(
      title: "Draw",
      content: Text(
        "It's a Draw!",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  void playagain() {
    gameboard.value = [
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
      RxString(" "),
    ].obs;
    clickCount.value = 0;
    Get.back();
  }
}






































































// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class Controller extends GetxController {
//   RxList<String> gamevalue = [
//     " ",
//     " ",
//     " ",
//     " ",
//     " ",
//     " ",
//     " ",
//     " ",
//     " ",
//   ].obs;

//   RxBool isX = false.obs;
//   RxInt click = 0.obs;
//   void addvalue(int index) {
//     if (gamevalue[index] == " ") {
//       if (isX.value == true) {
//         gamevalue[index] = "X";
//         isX.value = !isX.value;
//         click++;
//       } else {
//         gamevalue[index] = "O";
//         isX.value = !isX.value;
//         click++;
//       }
//     } else {
//       print("invalid click");
//     }

//     print('Click $click');
//     matchdrawmessage(click);
//     checkwinner();
//   }

//   void matchdrawmessage(click) {
//     if (click == 9) {
//       Get.defaultDialog(
//         title: "Match draw",
//         cancel: Text("Cancel"),
//         confirm: TextButton(
//             onPressed: () {
//               gamevalue.value = [
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//                 " ",
//               ];
//               click = 0;
//               Get.back();
//             },
//             child: Text("Play again")),
//       );
//     }
//   }

//   void checkwinner() {
//     if (gamevalue[0] == gamevalue[1] &&
//         gamevalue.value[0] == gamevalue[2] &&
//         gamevalue[0] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[3] == gamevalue[4] &&
//         gamevalue[3] == gamevalue[5] &&
//         gamevalue[3] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[6] == gamevalue[7] &&
//         gamevalue[6] == gamevalue[8] &&
//         gamevalue[6] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[0] == gamevalue[3] &&
//         gamevalue[0] == gamevalue[6] &&
//         gamevalue[0] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[1] == gamevalue[4] &&
//         gamevalue[1] == gamevalue[7] &&
//         gamevalue[1] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[2] == gamevalue[5] &&
//         gamevalue[2] == gamevalue[8] &&
//         gamevalue[2] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[0] == gamevalue[4] &&
//         gamevalue[0] == gamevalue[8] &&
//         gamevalue[0] != "") {
//       winnnerdialogbox();
//     } else if (gamevalue[2] == gamevalue[4] &&
//         gamevalue[2] == gamevalue[6] &&
//         gamevalue[2] != "") {
//       winnnerdialogbox();
//     }
//   }

//   void winnnerdialogbox() {
//     Get.defaultDialog(
//         title: "Winner ",
//         content: Column(
//           children: [
//             Icon(
//               Icons.confirmation_num_outlined,
//               size: 50,
//               color: Colors.green,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             isX.value
//                 ? Text(
//                     "X in winner ",
//                     style: TextStyle(fontSize: 30),
//                   )
//                 : Text(
//                     "O in winner ",
//                     style: TextStyle(fontSize: 30),
//                   ),
//           ],
//         ));
//   }
// }
