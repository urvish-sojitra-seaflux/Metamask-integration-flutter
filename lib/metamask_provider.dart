import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/ethereum.dart';

class MetaMaskProvider extends ChangeNotifier {
  //Fetching the Current address of Account
  String currentAddress = '';

  // For storing the value of Account Address
  var account = "";

  //Ehtereum chain is Enabled and not null
  bool get isEnabled => ethereum != null;

  //Connected if chain and address are not empty
  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  //Future function for Requesting of Account
  Future<void> connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();

      account = accs[0];

      if (accs.isNotEmpty) currentAddress = accs.first;

      notifyListeners();
    }
  }
}
