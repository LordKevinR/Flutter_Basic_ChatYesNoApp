enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime? sendTime;

  Message(
      {required this.text,
      this.imageUrl,
      required this.fromWho,
      this.sendTime});
}
