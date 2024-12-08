import 'package:flutter/material.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/item_history_widget.dart';
import 'package:mmimobile/widget/list_between_widget.dart';

class DetailHistoryScreen extends StatelessWidget {
  const DetailHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
            // goRouter.goNamed(RouteScreen.app);
            goRouter.pop(context);
          },
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              size: 26.0,
            ),
          ),
        ),
        centerTitle: true,
        title:
            Text("Detail History", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListBetween(
                field: "IDTransaksi : ",
                value: "SO-230800092",
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ListBetween(
                field: "Category : ",
                value: "Ro-Kemasan / New",
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ListBetween(
                field: "Type : ",
                value: "ODM / OEM",
              ),
              const SizedBox(
                height: 30.0,
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ItemHistory(
                  onTap: () {
                    goRouter.goNamed(RouteScreen.detailProduct);
                  },
                  isDetail: true,
                  shadow: false,
                  nameSO: "SO-24-007191",
                  productCount: 10,
                  date: "01-October-2024",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                color: ColorApps.primary,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ListBetween(
                field: "Total : ",
                value: "Rp.10.000.000",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
