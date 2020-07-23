/// Support for doing something awesome.
///
/// More dartdocs go here.
library easy_way_mysql;

import 'package:mysql1/mysql1.dart';

void main() async {
  var x = MinifiedMySQLConnector();
 await x.executeSelectQuery('x', columnAliases: m);
}

final emptyMap = <String, String>{};
final m = {"A": "a"};

class MinifiedMySQLConnector {
  MySqlConnection connection;
  Future<MySqlConnection> createConnection(
      String host, String user, String password, String database,
      [int port = 3306]) async {
    var settings = ConnectionSettings(
        host: host, user: user, password: password, db: database, port: port);
    connection = await MySqlConnection.connect(settings);
    return connection;
  }

  Future<Results> executeSelectQuery(String table,
      {Map<String, String> columnAliases}) async {
    var selectQueryString = _getSelectQueryString(columnAliases);
    var query = 'select $selectQueryString from ${table}';
    var results = await connection.query(query);
    return results;
  }

  String _getSelectQueryString(Map<String, String> columnAliases) {
    var selectQueryStr = '';
    if (columnAliases.isEmpty) {
      selectQueryStr = '*';
    } else {
      columnAliases.forEach((colName, aliasName) {
        selectQueryStr += '$colName';
        if (aliasName != '*') selectQueryStr += 'as $aliasName,';
      });
      if (selectQueryStr.endsWith(',')) {
        selectQueryStr = selectQueryStr.substring(0, selectQueryStr.length - 1);
      }
    }
    return selectQueryStr;
  }
}
