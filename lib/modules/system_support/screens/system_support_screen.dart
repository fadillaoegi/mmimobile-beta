import 'package:flutter/material.dart';
import 'package:mmimobile/modules/system_support/providers/system_support_provider.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/widget/section_title_widget.dart';
import 'package:mmimobile/widget/system_support/carousel_widget.dart';
import 'package:mmimobile/widget/system_support/item_system_support_widget.dart';
import 'package:provider/provider.dart';

class SystemSupportScreen extends StatefulWidget {
  const SystemSupportScreen({super.key});

  @override
  State<SystemSupportScreen> createState() => _SystemSupportScreenState();
}

class _SystemSupportScreenState extends State<SystemSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final systemSupportP = Provider.of<SystemSupportProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: CAROUSEL
                CarouselSystemSupport(systemSupportP: systemSupportP),
                const SizedBox(
                  height: 10.0,
                ),

                // NOTE: SECTION FREE CLASS
                SectionTittle(
                  title: "Free Class",
                  onTap: () => goRouter.goNamed(RouteScreen.classFree),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        systemSupportP.itemEmpty.length,
                        (index) => const ItemSystemSupport(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // NOTE: SECTION PREMIUM CLASS
                const SectionTittle(
                  title: "Premium Class",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        systemSupportP.itemEmpty.length,
                        (index) => const ItemSystemSupport(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // NOTE: SECTION FORUM
                const SectionTittle(
                  title: "Forum",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                    height: 200.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          systemSupportP.itemEmpty.length,
                          (index) => const ItemSystemSupport(),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
