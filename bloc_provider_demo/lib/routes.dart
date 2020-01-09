
import 'package:flutter/material.dart';

import 'View/First.dart';
import 'View/Second.dart';

final routes = {
  '/First': (BuildContext context) => new First(),
  '/': (BuildContext context) => new First(),
  First.tag: (context) => First(),
  Second.tag: (context) => Second(),


};
