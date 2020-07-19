/// Support for doing something awesome.
///
/// More dartdocs go here.
library easy_way_mysql;

import 'package:mysql1/mysql1.dart';

void main() {}

class EasyWay {
 dynamic connection;
  Future<MySqlConnection> createConnection(
      String host, String user, String password, String database,
      [int port = 3306]) async {
    var settings = ConnectionSettings(
        host: host, user: user, password: password, db: database, port: port);
    connection = await MySqlConnection.connect(settings);
    return connection;
  }
  

}

