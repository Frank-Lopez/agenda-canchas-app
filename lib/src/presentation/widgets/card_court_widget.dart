import 'package:flutter/material.dart';

class CardCourtWidget extends StatelessWidget {
  final String name;
  final String image;
  final String data;
  final VoidCallback onTap;
   const CardCourtWidget(
      {super.key, required this.name, required this.image, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
              ),
              width: double.infinity,
              height: 100,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Text("Cancha $name"),
            Text("Datos: $data"),
          ],
        ),
      ),
    );
  }
}
