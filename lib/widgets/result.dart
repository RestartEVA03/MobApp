import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int result;
  final onClearState;

  Result({Key? key,
    required this.result,
    required this.onClearState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String msg = '';
    Widget img;

    switch (result){
      case 7:
        msg = 'Алиса «Дождь»';
        img = Image.asset('assets/images/rain.jpg');
        break;
      case 8:
        msg = 'AC/DC Hell Bells';
        img = Image.asset('assets/images/hells_bells.jpg');
        break;
      case 9:
        msg = 'Мельница Волкодав';
        img = Image.asset('assets/images/melniza.png');
        break;
      case 10:
        msg = 'Faun Tanz mit mir';
        img = Image.asset('assets/images/faun.jpeg');
        break;
      case 11:
        msg = 'Ray Charles Georgia On My Mind';
        img = Image.asset('assets/images/Ray.jpeg');
        break;
      case 12:
        msg = 'Alt-j Taro';
        img = Image.asset('assets/images/altj.jpeg');
        break;
      case 13:
        msg = 'Slipknot Custer';
        img = Image.asset('assets/images/Slipknot.jpg');
        break;
      case 14:
        msg = 'Dio We Rock';
        img = Image.asset('assets/images/dio.jpeg');
        break;
      default:
        msg = 'Малова-то ответов';
        img = Image.asset('assets/images/background.jpeg');
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15.0,
            spreadRadius: 0.0,
            offset: Offset(2 , 5, ),
          )
        ],
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: <Color>[
          Color(0xFF5337ff),
          Color(0xFF8131ff),
          Color(0xFFbd27ff),
        ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
            ),
          ),

          TextButton(
            child: Text('Пройти тест еще раз'),
            onPressed: onClearState,
          ),
        ],
      ),
    );
  }
}
