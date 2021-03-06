import 'package:app_filme_api/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                        text: "⭐ Nota Média - " + vote!, size: 18),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name ?? "Não Carregado",
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: "Lançado Em - " + launch_on!,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(
                      text: description!,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
