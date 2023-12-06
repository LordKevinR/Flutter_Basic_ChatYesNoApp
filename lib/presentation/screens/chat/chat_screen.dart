import 'package:chat_yes_no_app/domain/entities/message.dart';
import 'package:chat_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:chat_yes_no_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:chat_yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      //para que el widget no este en sitios como debajo de los botones, etc
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                //para ocupar toda el area disponible
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.me)
                    ? MyMessageBuble(
                        message: message,
                      )
                    : HerMessageBubble(message: message);
              },
            )),

            //Caja de Texto
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: MessageFieldBox(),
            )
          ],
        ),
      ),
    );
  }
}

final _appbar = AppBar(
  title: const Text("Mi amor ❤"),
  centerTitle: false,
  leading: const Padding(
    padding: EdgeInsets.all(4.0),
    child: CircleAvatar(
      backgroundImage: NetworkImage(
          "https://media.licdn.com/dms/image/C5603AQG_4LEvkrxLyQ/profile-displayphoto-shrink_800_800/0/1613606893569?e=1706745600&v=beta&t=y2rFVz_89_8mvOaDSMrlMzaFvpF1OqD5KYNmfEawwcg"),
    ),
  ),
);
