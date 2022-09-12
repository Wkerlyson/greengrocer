import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/services/util_services.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(children: [
        Expanded(
          child: Image.asset(item.imgUrl),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Nome - QTD
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.itemName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 30, width: 70, color: Colors.red),
                  ],
                ),

                //preço
                Text(
                  utilServices.priceToCurrency(item.price),
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.customSwatchColor,
                  ),
                ),

                //Descrição
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),

                //Botao
                ElevatedButton(onPressed: () {}, child: Text('botão'))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
