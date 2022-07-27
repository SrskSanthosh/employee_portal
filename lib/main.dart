import 'package:employee_portal/pages/pages.dart';
import 'package:employee_portal/services/auth_service.dart';
import 'package:employee_portal/styles/styles.dart';

AuthService appAuth = new AuthService();
bool result = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  result = await appAuth.checkAlreadyLogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        LoginPage.routeName: (BuildContext _) => const LoginPage(),
        EmployeeListPage.routeName: (BuildContext _) =>
            const EmployeeListPage(),
        EmployeeDetailsPage.routeName: (BuildContext _) =>
            const EmployeeDetailsPage(),
      },
      home: result ? const EmployeeListPage() : const LoginPage(),
    );
  }
}
