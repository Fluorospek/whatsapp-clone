class Chatmodel {
  late String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMsg;
  String? status;
  bool selected = false;

  Chatmodel({
    required this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMsg,
    this.status,
    this.selected = false,
  });
}
