
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../view_model/i_gave/i_gave.dart';
import 'widgets/extra_field.dart';


class IGotScreen extends StatelessWidget {
  const IGotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IGave>(
      context,
    );
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('I Got'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: provider.controller,
              autofocus: true,
              cursorColor: blackColor,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                provider.changeButtonColor();
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: fieldColor,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: fieldColor,
                  ),
                ),
                filled: true,
                fillColor: greyColor.shade50,
                hintText: 'Amount',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: greyColor.shade400),
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Rs',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            if (provider.controller.text.isNotEmpty)
              TextFormField(
                autofocus: true,
                cursorColor: blackColor,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  provider.changeButtonColor();
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: fieldColor,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: fieldColor,
                    ),
                  ),
                  filled: true,
                  fillColor: greyColor.shade50,
                  hintText: 'Details (Optional)',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: greyColor.shade400),
                ),
              ),
            SizedBox(
              height: size.height * 0.02,
            ),
            if (provider.controller.text.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TExtraField(
                      title: '9th May, 24',
                      icon: Icons.calendar_today_sharp,
                      onPress: () {}),
                  TExtraField(
                      title: 'Add bills',
                      icon: Icons.photo_camera,
                      onPress: () {}),
                ],
              ),
            provider.controller.text.isEmpty
                ? SizedBox(
              height: size.height * 0.30,
            )
                : SizedBox(
              height: size.height * 0.15,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: provider.changeColor ? greenColor : fieldColor,
                  foregroundColor: whiteColor,
                ),
                onPressed: () {},
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
