import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../view_model/customer_details/customer_details.dart';
import 'i_gave.dart';
import 'widgets/bottom_button.dart';
import 'i_got.dart';
import 'widgets/image_text_animation.dart';
import 'widgets/transaction_details.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final String title;
  const CustomerDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final provider = Provider.of<CustomerDetailsView>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomButton(
              text: 'I GAVE',
              iconData: Icons.arrow_upward,
              background: redColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IGaveScreen()));
              },
            ),
            BottomButton(
              text: 'I GOT',
              iconData: Icons.arrow_downward,
              background: greenColor,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IGotScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:  Text(title ?? ''),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greenColor.withOpacity(0.07),
                ),
                child: ListTile(
                  leading: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: darkGreenColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Icon(
                        Icons.minimize,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  title: Text(
                    'Rs ${provider.balance.toString()}',
                    style: TextStyle(
                        color: darkGreenColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'clear',
                    style: TextStyle(color: darkGreenColor.withOpacity(0.8)),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              provider.balance < 0
                  ? const TImageTextAnimation()
                  : const TTransactionDetails()
            ],
          ),
        ),
      ),
    );
  }
}
