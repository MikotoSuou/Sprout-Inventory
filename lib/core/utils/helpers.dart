
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:sprout_inventory/res/values.dart' as values;

import '../../res/colors.dart';
import 'logger.dart';

EventTransformer<E> debounceEvent<E>({
  Duration duration = const Duration(milliseconds: 250)
}) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

void showErrorSnackBar(BuildContext context, {required String error}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Icon(Icons.error_outline_rounded, color: ColorManager.white),
        const Space(width: values.Size.s10),
        Expanded(
          child: Text(
            error,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(values.Size.s8)
    ),
    backgroundColor: ColorManager.red,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void hideSnackBar(BuildContext context) {
  try {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  } catch (error) {
    logger.e(error);
  }
}