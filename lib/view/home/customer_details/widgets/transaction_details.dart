import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../utils/color.dart';
import '../../../../view_model/customer_details/customer_details.dart';
import 'icon_text.dart';

class TTransactionDetails extends StatelessWidget {
  const TTransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final provider = Provider.of<CustomerDetailsView>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TIconText(
                title: 'SMS',
                icon: Icons.message,
                color: blueAccentColor,
              ),
              TIconText(
                title: 'WhatsApp',
                icon: FontAwesomeIcons.whatsapp,
                color: greenColor,
              ),
              TIconText(
                title: 'Reports',
                icon: Icons.picture_as_pdf,
                color: blueAccentColor,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text('Date'),
                ],
              ),
              Row(
                children: [
                  const Text('I Gave'),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  const Text('I Got'),
                ],
              ),
            ],
          ),
          Divider(
            color: greyColor.shade100,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ListView.separated(
            separatorBuilder: (_,__)=>Divider(color: greyColor.shade200,),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                horizontalTitleGap: 50,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  '10th May, 04:41 PM',
                  style: TextStyle(fontSize: 11),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: greenColor.withOpacity(0.07),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Text('Bal. Rs.0', style: TextStyle(color: blackColor),),
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    provider.iGave
                        ? Padding(
                            padding: EdgeInsets.only(right: size.width * 0.27),
                            child: const Text(
                              'Rs. 55',
                              style: TextStyle(color: redColor),
                            ),
                          )
                        : const Text(
                            'Rs, 25',
                            style: TextStyle(color: greenColor),
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
