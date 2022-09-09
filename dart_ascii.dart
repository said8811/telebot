import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() async {
  var BOT_TOKEN = '5472505234:AAGiZN1REG-j6rq8MQDVU5eQkR2IvPHoMmE';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  teledart.start();
  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
      (message) => teledart.sendMessage(message.chat.id,
          "Salom! bu bot sizga belgilarning ascii codelarini olib beradi"));
  teledart.onMessage(entityType: 'bot_command', keyword: 'ascii').listen(
      (message) =>
          teledart.sendMessage(message.chat.id, "sizga ASCII code kerakmi"));
  teledart
      .onMessage()
      .listen((message) => message.reply(ascii(message.text.toString())));
}

String ascii(String? word) {
  if (word is String) {
    List res = word.codeUnits;
    String ls = res.join('-');
    
    if (ls == "110-117-108-108") {
      return "nomalum ma'lumot";
    } else {
      return ls;
    }
  } else {
    return "nomalum malumot";
  }
}
