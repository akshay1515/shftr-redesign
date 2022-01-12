import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/pages/selectionactivity/selectionwidget.dart';

SelectionModalSheet({required BuildContext context}) => showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    builder: (_) {
      return SelectionWidget();
    });
