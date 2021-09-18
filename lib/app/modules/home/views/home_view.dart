import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsbank_remittance/app/modules/transfer/views/transfer_view.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:jsbank_remittance/app/utils/widgets/balance_card.dart';
import 'package:jsbank_remittance/app/utils/widgets/buttons/flat_white_button.dart';
import 'package:jsbank_remittance/app/utils/widgets/text/title_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
                  itemCount: 3,
                  // ignore: avoid_print
                  itemBuilder: (_, index) => BalanceCard("Home Remittance Account","2,242","EUR","354,000 PKR","Send",(){print("onclick Send Remittance!");}),
                )
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [TitleText(text: 'Operations')],
            ),
            _operationsWidget(),
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

  Widget _operationsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _icon(Icons.attach_money, "Remit USD"),
        _icon(Icons.euro, "Remit EUR"),
        _icon(Icons.attach_money, "Remit SGD"),
      ],
    );
  }

  Widget _icon(IconData icon, String text) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, '/transfer');
            Get.to(TransferView());
          },
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
          _transaction("Flight Ticket", "23 Feb 2020", true, "200 PKR"),
          _transaction("Electricity Bill", "25 Feb 2020", false, "-100 PKR"),
          _transaction("Flight Ticket", "03 Mar 2020", true, "555,000 PKR"),
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
