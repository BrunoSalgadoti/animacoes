import 'package:flutter/material.dart';

class animacaoImplicita extends StatefulWidget {
  const animacaoImplicita({Key? key}) : super(key: key);

  @override
  State<animacaoImplicita> createState() => _animacaoImplicitaState();
}

class _animacaoImplicitaState extends State<animacaoImplicita> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          AnimatedContainer(
            duration: const Duration(seconds: 2),
            padding:  const EdgeInsets.all(20),
            width: _status ? 200 : 300,
            height: _status ? 300 : 200,
            color: _status ? Colors.white : Colors.purpleAccent,
            child: Image.asset("imagens/logo.png"),
            curve: Curves.elasticInOut,
          ),

          Padding(padding: EdgeInsets.only(top: 20)),

          ElevatedButton(
              onPressed: (){
                setState(() {
                  _status = !_status;
                });
              },

              child: Text("Alterar"),

              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shadowColor: Colors.black,
                  elevation: 15,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ))
          )]
    );
  }
}
