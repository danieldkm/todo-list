import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_todo_list/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_todo_list/app/core/ui/message.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;
  DefaultListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successCallback,
    EverVoidCallback? everCallback,
    ErrorVoidCallback? errorCallback,
  }) {
    changeNotifier.addListener(() {
      if (everCallback != null) everCallback(changeNotifier, this);
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if (errorCallback != null) {
          errorCallback(changeNotifier, this);
        }
        Message.of(context).showError(changeNotifier.error ?? 'Erro interno');
      } else if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerNotifier,
);
typedef ErrorVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerNotifier,
);
typedef EverVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerNotifier,
);
