import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/toast.dart';

class PickContactController extends ChangeNotifier {
  PickContactController(){
    _loadAddedContacts();
  }
  final searchController = TextEditingController();
  List<String> tempList = [];
  List<Contact> allContact = [];
  List<Contact> contactsFiltered = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void addOrRemoveContact(String phoneNumber) async{

    if (tempList.contains(phoneNumber)) {
      showToastMesg();
    } else {
      tempList.add(phoneNumber);
      await _saveAddedContacts();

    }
    notifyListeners();
  }

  Future<void> _saveAddedContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addedContacts', tempList);

    print("The sp ${prefs.get('addedContacts')}");
  }

  Future<void> _loadAddedContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tempList = prefs.getStringList('addedContacts') ?? [];
    notifyListeners();
  }

  // Future<void> getAllContact() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   List<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
  //   contacts = contacts.where((element) => element.phones!.isNotEmpty).toList();
  //
  //   final unique = [...{...contacts}];
  //
  //   allContact = contacts;
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  Future<void> getAllContact() async {
    _isLoading = true;
    notifyListeners();

    List<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);

    // Filter out contacts without phone numbers
    contacts = contacts.where((element) => element.phones!.isNotEmpty).toList();

    // Use a Set to track unique phone numbers
    Set<String> uniquePhoneNumbers = {};
    List<Contact> uniqueContacts = [];

    for (var contact in contacts) {
      for (var phone in contact.phones!) {
        if (!uniquePhoneNumbers.contains(phone.value)) {
          uniquePhoneNumbers.add(phone.value!);
          uniqueContacts.add(contact);
          break; // No need to check other numbers of this contact
        }
      }
    }
    uniqueContacts.sort((a, b) => a.displayName!.compareTo(b.displayName!));

    allContact = uniqueContacts;

    _isLoading = false;
    notifyListeners();
  }

  void filterContacts() {
    List<Contact> contact = [];
    contact.addAll(allContact);
    if (searchController.text.isNotEmpty) {
      contact.retainWhere((element) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = element.displayName!.toLowerCase();
        return contactName.contains(searchTerm);
      });
      contactsFiltered = contact;
    } else {
      contactsFiltered = allContact;
    }
    notifyListeners();
  }

  Future<void> askPermissions(BuildContext context) async {
    PermissionStatus permissionStatus = await getContactPermission();
    if (permissionStatus != PermissionStatus.granted) {
      if (context.mounted) {
        handleInvalidPermission(context, permissionStatus);
      }
    }
  }

  Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void handleInvalidPermission(
      BuildContext context, PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
