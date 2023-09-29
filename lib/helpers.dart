import 'package:flutter/material.dart';

class UIHelper {
  static showSnackBar(
      {required BuildContext context, String content = 'content'}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  /// loading dialog for loading
  static LoadingBlock(
      {required BuildContext context, String message = 'Loading...'}) {
    double size = 150;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width - size) / 2,
          ),
          child: SizedBox(
            width: size,
            height: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }
}
