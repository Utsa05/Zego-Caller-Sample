import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zego_caller_simple/call/view/call_view.dart';
import 'package:zego_caller_simple/home/model/user.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          UserBarTop(user: user),
          const SizedBox(
            height: 16.0,
          ),
          const CallBarBottom()
        ],
      ),
    );
  }
}

class UserBarTop extends StatefulWidget {
  const UserBarTop({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<UserBarTop> createState() => _UserBarTopState();
}

class _UserBarTopState extends State<UserBarTop> {
  final TextEditingController _callidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white60,
          backgroundImage: NetworkImage(widget.user.image),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.user.callType,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title:
                                const Center(child: Text("Join a New Process")),
                            content: TextField(
                              controller: _callidController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Call ID"),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => CallView(
                                                callID: _callidController.text,
                                              )));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                ),
                                child: const Text(
                                  "Join",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                child: const Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ));
                },
                style: const ButtonStyle(),
                child: const Text(
                  "Join",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CallBarBottom extends StatelessWidget {
  const CallBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CallButton(
          title: "Voice",
          color: Colors.red,
          icon: Icons.phone_outlined,
          tap: () {},
        ),
        CallButton(
          title: "Video",
          color: Colors.green,
          icon: Icons.video_call_rounded,
          tap: () {},
        ),
        CallButton(
          title: "Group Voice",
          color: Colors.brown,
          icon: Icons.group_outlined,
          tap: () {},
        ),
        CallButton(
          title: "Group Video",
          color: Colors.deepPurple,
          icon: Icons.video_camera_back_outlined,
          tap: () {},
        ),
        CallButton(
          title: "Strem",
          color: Colors.cyan,
          icon: Icons.living_outlined,
          tap: () {},
        ),
      ],
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({
    super.key,
    required this.icon,
    required this.tap,
    required this.color,
    required this.title,
  });
  final IconData icon;
  final GestureTapCallback tap;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          // radius: 20.0,
          backgroundColor: color,
          child: IconButton(
              splashColor: Colors.white,
              onPressed: tap,
              icon: Icon(
                icon,
                color: Colors.white,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 10.0),
        )
      ],
    );
  }
}
