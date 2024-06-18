// import 'package:example/constants/colors.dart';
// import 'package:example/constants/strings.dart';
// import 'package:example/pages/grid_example.dart';
// import 'package:example/pages/grid_with_scrollcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:halonot/widgets/local/calendar.dart';
import 'package:halonot/widgets/local/draggable.dart';


class MyApp5 extends StatefulWidget {
  const MyApp5({Key? key}) : super(key: key);
  @override
  MyApp5State createState() => MyApp5State();

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: DraggableGridViewBuilder(
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3),
  //         ),
  //         children: [DraggableGridItem(child: TableBasicsExample())],
  //         isOnlyLongPress: false,
  //         dragCompletion: (List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
  //           print( 'onDragAccept: $beforeIndex -> $afterIndex');
  //         },
  //         dragFeedback: (List<DraggableGridItem> list, int index) {
  //           return Container(
  //             child: list[index].child,
  //             width: 200,
  //             height: 150,
  //           );
  //         },
  //         dragPlaceHolder: (List<DraggableGridItem> list, int index) {
  //           return PlaceHolderWidget(
  //             child: Container(
  //               color: Colors.white,
  //             ),
  //           );
  //         },
  //       )
  //   );
  // }
}

class MyApp5State extends State<MyApp5>{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      home: DraggableGridViewBuilder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3),
      ),
      children: [DraggableGridItem(isDraggable:true, child: TableBasicsExample())],
      isOnlyLongPress: true,
      dragCompletion: (List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
        print( 'onDragAccept: $beforeIndex -> $afterIndex');
      },
      dragFeedback: (List<DraggableGridItem> list, int index) {
        return Container(
          child: list[index].child,
          width: 200,
          height: 150,
        );
      },
      dragPlaceHolder: (List<DraggableGridItem> list, int index) {
        return PlaceHolderWidget(
          child: Container(
            color: Colors.white,
          ),
        );
      },
    ));
  }
}