import 'package:flutter/cupertino.dart';
import '../views/ar_screens/objectgesturesexample.dart';
import '../views/ar_screens/objectsonplanesexample.dart';
import '../views/ar_screens/screenshotexample.dart';
import '../views/ar_screens/debugoptionsexample.dart';

class Category {
  String name;
  String image;
  Widget widget;
  String description;

  Category(
      {required this.name,
      required this.image,
      required this.widget,
      required this.description});
}

List<Category> categoryList = [
  Category(
    name: "Debug Options",
    image: "images/debug.png",
    widget: DebugOptionsWidget(),
    description:
        "Simple AR scene with toggles to visualize the world origin, feature points and tracked planes",
  ),
  Category(
    name: "Objects & Anchors on Planes",
    image: "images/anchor.png",
    widget: ObjectsOnPlanesWidget(),
    description:
        "AR Scene in which tapping on a plane creates an anchor with a 3D model attached to it",
  ),
  Category(
    name: "Object Transformation Gestures",
    image: "images/turn.png",
    widget: ObjectGesturesWidget(),
    description:
        "Same as Objects & Anchors on Planes example, but objects can be panned and rotated using gestures after being placed",
  ),
  Category(
    name: "Screenshots",
    image: "images/screenshot.png",
    widget: ScreenshotWidget(),
    description:
        "Same as Objects & Anchors on Planes Example, but the snapshot function is used to take screenshots of the AR Scene",
  ),
];
