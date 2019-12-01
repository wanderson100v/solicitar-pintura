
class Msg{
  String state;
  String msgText;

  Msg.error(String msg){
    this.state = "dange";
    this.msgText = msg;
  }

  Msg.fromJSON(Map<String,dynamic> msgJson){
    this.state = msgJson["state"];
    this.msgText = msgJson["msg"];
  }
}