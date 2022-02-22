import 'package:mysql1/mysql1.dart';
class Mysql {
  
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
