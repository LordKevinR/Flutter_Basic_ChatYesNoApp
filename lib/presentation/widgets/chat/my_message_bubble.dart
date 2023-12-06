import 'package:chat_yes_no_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBuble extends StatelessWidget {
  final Message message;
  const MyMessageBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "${message.sendTime!.hour}:${message.sendTime!.minute}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
