import 'package:chat_yes_no_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerChilden(colors: colors, message: message),
        const SizedBox(
          height: 5,
        ),
        _ImageBuble(message),
        const SizedBox(height: 15),
      ],
    );
  }
}

class ContainerChilden extends StatelessWidget {
  const ContainerChilden({
    super.key,
    required this.colors,
    required this.message,
  });

  final ColorScheme colors;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

class _ImageBuble extends StatelessWidget {
  final Message message;
  const _ImageBuble(this.message);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      //nos permite hacer bordes redondeados
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        message.imageUrl!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            color: Colors.grey.shade300,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Loading gif")],
            ),
          );
        },
      ),
    );
  }
}
