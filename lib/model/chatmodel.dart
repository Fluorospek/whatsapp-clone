class Chatmodel {
  late String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMsg;
  String? status;
  Chatmodel({
    required this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMsg,
    this.status,
  });
}
