import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsbank_remittance/app/modules/transfer/controllers/transfer_controller.dart';
import 'package:jsbank_remittance/app/modules/transfer/views/transfer_view.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/balance_card.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_white_button.dart';
import 'package:jsbank_remittance/app/utils/widgets/text/title_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  final TransferController _transferController = Get.put(TransferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.primaryGradientTop,
        primary: true,
        leading: Container(),
        title: SizedBox(
            width: 150,
            child: Image.asset("assets/images/whitelogo.png"),
          ),
          centerTitle: true
      ),
      body: SingleChildScrollView(
    child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [TitleText(text: 'My Wallets')],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _transferController.allWallets.allWallets!.length,
                  // ignore: avoid_print
                  itemBuilder: (_, index) => BalanceCard(_transferController.allWallets.allWallets![index].title,
                      _transferController.allWallets.allWallets![index].amount!.toStringAsFixed(2),
                      _transferController.allWallets.allWallets![index].currency,
                      _transferController.allWallets.allWallets![index].buttonText,
                          (){
                            _transferController.sendingCurrencyController.text = _transferController.allWallets.allWallets![index].currency!;
                            _transferController.sendingAmountController.text = _transferController.allWallets.allWallets![index].amount!.toStringAsFixed(2);
                            Get.to(TransferView());
                          }),
                )
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [TitleText(text: 'Operations')],
            ),
            _operationsWidget(context),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [TitleText(text: 'Transactions')],
            ),
            _transactionList(),
          ],
        ),
      ),
    );
  }

  Widget _operationsWidget(BuildContext context) {
    /*return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _icon(Icons.attach_money, "Remit USD"),
        _icon(Icons.euro, "Remit EUR"),
        _icon(Icons.attach_money, "Remit SGD"),
      ],
    );*/
    return SizedBox(
        height: MediaQuery.of(context).size.width * 0.3,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _transferController.allWallets.allWallets!.length,
        itemBuilder: (_, index) => _icon(Icons.money, "Remit "+_transferController.allWallets.allWallets![index].currency!, (){
          _transferController.sendingCurrencyController.text = _transferController.allWallets.allWallets![index].currency!;
          _transferController.sendingAmountController.text = _transferController.allWallets.allWallets![index].amount!.toStringAsFixed(2);
          Get.to(TransferView());
        })
    ),
    );
  }

  Widget _icon(IconData icon, String text, Function()? onTap) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff3f3f3),
                      offset: Offset(5, 5),
                      blurRadius: 10)
                ]),
            child: Icon(icon),
          ),
        ),
        Text(text,
            style: GoogleFonts.mulish(
                //textStyle: Theme.of(context).textTheme.display1,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xff76797e))),
      ],
    );
  }

  Widget _transactionList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          _transaction("Converted from USD", "120 USD", true, "21,453 PKR"),
          _transaction("Converted from EUR", "250 EUR", true, "42,254 PKR"),
          _transaction("Converted from CAD", "10 CAD", true, "2,523 PKR"),
        ],
      ),
    );
  }

  Widget _transaction(String text, String time, bool isCredit, String amount) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: ColorHelper.navyBlue1,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: isCredit? const Icon(Icons.arrow_downward, color: Colors.white) :const Icon(Icons.arrow_upward, color: Colors.white),
      ),
      contentPadding: const EdgeInsets.symmetric(),
      title: TitleText(
        text: text,
        fontSize: 14,
      ),
      subtitle: Text(time),
      trailing: Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorHelper.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(amount,
              style: GoogleFonts.mulish(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorHelper.navyBlue2))),
    );
  }
}
