import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';

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

  static Future<String?> askDialogBox(
      {required BuildContext context, String title = 'title'}) async {
    TextEditingController controller = TextEditingController();
    String? answer;
    answer = await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Create a $title',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: '$title Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: themeColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withAlpha(200),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 20),
                  FilledButton(
                    onPressed: () {
                      if (controller.text != '') {
                        Navigator.pop(context, controller.text);
                      }
                    },
                    child: Text('Create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return answer;
  }
}
