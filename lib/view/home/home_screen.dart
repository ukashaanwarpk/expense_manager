import 'package:flutter/material.dart';
import '../../utils/color.dart';
import 'widget/add_customer_button.dart';
import 'widget/details_card.dart';
import 'widget/image_and_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TDetailsCard(
                  text: 'I have to get',
                  cardColor: redColor.withOpacity(0.07),
                  textColor: redColor,
                  subTextColor: redColor,
                  circleColor: redColor,
                ),
                TDetailsCard(
                  text: 'I have to give',
                  cardColor: greenColor.withOpacity(0.07),
                  textColor: greenColor,
                  subTextColor: greenColor,
                  circleColor: greenColor,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const TImageAndText(),
            SizedBox(
              height: size.height * 0.05,
            ),
            const AddCustomerButton(),
          ],
        ),
      ),
    );
  }
}
