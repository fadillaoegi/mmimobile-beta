import 'package:flutter/material.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/item_history_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    // final goRouter = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        title: Text(
          "History",
          style: primary700.copyWith(fontSize: 20.0),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: sizeScreen.width,
          height: sizeScreen.height,
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemHistory(
                    onTap: () {
                      // Navigator.pushNamed(context, RouteScreen.detailHistory);
                      goRouter.goNamed(RouteScreen.detailHistory);
                    },
                    shadow: false,
                    nameSO: "SO-24-007191",
                    productCount: 10,
                    date: "01-October-2024",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
