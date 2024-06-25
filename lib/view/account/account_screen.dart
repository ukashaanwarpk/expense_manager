
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import 'widgets/account_menu_tile.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ukasha'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  title: Text(
                    'Your Name',
                    style: TextStyle(color: greyColor.shade500),
                  ),
                  subtitle: Text(
                    '03068269025',
                    style: TextStyle(color: greyColor.shade500),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: greyColor.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const TAccountMenuTile(),
            ],
          ),
        ),
      ),
    );
  }
}


