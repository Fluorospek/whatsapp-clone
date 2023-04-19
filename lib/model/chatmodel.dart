class Chatmodel {
  late String name;
  String? icon;
  late bool isGroup;
  late String time;
  late String currentMsg;
  Chatmodel({
    required this.name,
    this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMsg,
  });
}
