import 'package:flutter/material.dart';

class CriandoAnimacoesBasicas extends StatefulWidget {
  const CriandoAnimacoesBasicas({Key? key}) : super(key: key);

  @override
  State<CriandoAnimacoesBasicas> createState() => _CriandoAnimacoesBasicasState();
}

class _CriandoAnimacoesBasicasState extends State<CriandoAnimacoesBasicas> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Meu App"),
      ),


      /*
      // container que aparece no topo da App bar ao pressionar o botão
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: Colors.green,
        padding: EdgeInsets.all(10),
        height: _status ? 0 : 100,
      ),

       */


      /*  // Animação com opacidade de um Icone de avião
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.only(bottom: 100, top: 20),
        alignment: _status ? Alignment.bottomCenter : Alignment.topCenter ,

        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity:  _status ? 1 : 0,
           child: const SizedBox(
              height: 50,
              child: Icon(
                Icons.airplanemode_active,
                size: 50,
                color: Colors.white,
              ),
            )
        ),
      ),
       */

      body: GestureDetector(
        onTap: (){
          setState(() {
            _status = !_status;
          });
        },
        child:  AnimatedContainer(
          duration: const Duration( milliseconds:  300),
          curve: Curves.linear,
          alignment: Alignment.center,
          width: _status ? 60 : 160,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:  BorderRadius.circular(30)
          ),
          child: Stack( children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: _status ? 1  : 0 ,
                child: const Icon(Icons.person_add, color: Colors.white,),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: _status ? 0  : 1 ,
                child: const Text(
                    "Mensagem",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],) ,
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.orange,
        foregroundColor: Colors.white,
        elevation: 6,
        child: const Icon(Icons.add_box),
        onPressed: (){
          setState(() {
            _status = !_status;
          });
        },
      ),
    );
  }
}


