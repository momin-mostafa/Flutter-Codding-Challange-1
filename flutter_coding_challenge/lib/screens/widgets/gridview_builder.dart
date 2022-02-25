import 'dart:js';

import 'package:flutter/material.dart';

Widget gridView_builder() {
  return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return GridTile(child: Container());
      });
}
