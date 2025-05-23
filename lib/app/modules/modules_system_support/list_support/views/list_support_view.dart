import 'package:flutter/material.dart';
import '../controllers/list_support_controller.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';  
import 'package:mmimobile/app/widget/system_support/item_list_support_widget.dart';

class ListSupportView extends GetView<ListSupportController> {
  const ListSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Kumpulan support",
      ),
      // body: const UnderdevelopmentScreen(),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  ItemListSupport(sizeScreen: sizeScreen),
            )
          ],
        )),
      ),
    );
  }
}

// class ItemClass extends StatelessWidget {
//   const ItemClass({
//     super.key,
//     required this.sizeScreen,
//   });

//   final Size sizeScreen;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.toNamed(Routes.supportDetail),
//       child: Container(
//         width: sizeScreen.width,
//         margin: const EdgeInsets.only(bottom: 12.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: boxShadow,
//           color: ColorApps.white,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               AssetConfigFLdev.bannerSystemSupport,
//               width: sizeScreen.width,
//               fit: BoxFit.cover,
//               height: 242.0 / 2,
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Tutorial Make Up agar tidak luntur dan tahan lamaa",
//                     style: black500,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   Row(
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.video_collection_outlined,
//                             color: ColorApps.disable,
//                           ),
//                           const SizedBox(
//                             width: 8.0,
//                           ),
//                           Text(
//                             "15",
//                             style: disable500,
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 60.0,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.timer_outlined,
//                             color: ColorApps.disable,
//                           ),
//                           const SizedBox(
//                             width: 8.0,
//                           ),
//                           Text(
//                             "120 menit",
//                             style: disable500,
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
