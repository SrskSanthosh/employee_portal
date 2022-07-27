import 'package:employee_portal/database/databaseHelper.dart';
import 'package:employee_portal/models/employee_model.dart';
import 'package:employee_portal/pages/pages.dart';
import 'package:employee_portal/styles/styles.dart';
import 'package:employee_portal/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeListPage extends StatefulWidget {
  static const String routeName = '/employee_list';
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Employees"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              pref.setBool("isLoggedIn", false);
              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  LoginPage.routeName, (Route<dynamic> route) => false);
            },
            icon: const Icon(
              Icons.logout,
              color: whiteColor,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return FutureBuilder<List<EmployeeModel>>(
      future: dbHelper
          .queryAllRows(), // a previously-obtained Future<String> or null
      builder:
          (BuildContext context, AsyncSnapshot<List<EmployeeModel>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return EmployeeCardWidget(
                  item: snapshot.data![index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length);
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ],
          );
        } else {
          return Column(
            children: const [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ],
          );
        }
      },
    );
  }
}
