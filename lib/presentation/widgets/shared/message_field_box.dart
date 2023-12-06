import 'package:chat_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.transparent));

    final inputDecoration = InputDecoration(
        hintText: 'End Your Message With a "?"', //placeholder
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            chatProvider.sendMessage(textController.value.text);
            textController.clear();
          },
        ));

    return TextFormField(
        focusNode: focusNode,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        controller: textController,
        textCapitalization: TextCapitalization.sentences,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          chatProvider.sendMessage(textController.value.text);
          textController.clear();
          focusNode.requestFocus();
        }

        // onChanged: (value) {
        //   print("change value $value");
        // },
        );
  }
}
