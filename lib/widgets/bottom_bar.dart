import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder:(context) => const AlertDialog(
                  contentPadding: EdgeInsets.all(25.0),
                  content: Text(
                    "Desenvolvido por Luiz Henrique e Hércules Soares, alunos do curso de Sistemas de Informação da UNIMONTES.",
                    textAlign: TextAlign.justify,
                  )
                ),
              ), 
              icon: const Icon(Icons.question_mark, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue[400])
              ),
            ),
          ],
        ),
      ),
    );
  }
}
