import 'package:mysql1/mysql1.dart';
class Mysql {
  static String host = 'sql606.main-hosting.eu',user = 'u527103888_d3',password='C#abc@123',db = 'u527103888_t3';
  static int port = 3306;
  Mysql();
  Future<MySqlConnection> getconnection() async{
    var setting = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(setting);
  }

}