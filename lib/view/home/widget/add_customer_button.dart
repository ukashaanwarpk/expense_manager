import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import '../../../view_model/customer_details/pick_contact.dart';
import '../pick_contact_screen.dart';

class AddCustomerButton extends StatefulWidget {
  const AddCustomerButton({
    super.key,
  });

  @override
  State<AddCustomerButton> createState() => _AddCustomerButtonState();
}

class _AddCustomerButtonState extends State<AddCustomerButton> {
  PickContactController pickContactController = PickContactController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pickContactController.askPermissions(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.70,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: blackColor,
          foregroundColor: whiteColor,
        ),
        onPressed: () {
          print('press');

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PickContactScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text(
          'ADD CUSTOMER',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
