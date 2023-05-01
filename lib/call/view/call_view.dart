import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zego_caller_simple/call/view/call_page.dart';

class CallView extends StatelessWidget {
  const CallView({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    return CallPage(
      callID: callID,
    );
  }
}
