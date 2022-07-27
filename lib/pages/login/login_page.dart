import 'package:employee_portal/database/databaseHelper.dart';
import 'package:employee_portal/models/employee_model.dart';
import 'package:employee_portal/pages/pages.dart';
import 'package:employee_portal/services/apiHelper.dart';
import 'package:employee_portal/services/api_response.dart';
import 'package:employee_portal/styles/styles.dart';
import 'package:employee_portal/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          appLogo(),
          appTextWidget(),
          appDescTextWidget(),
          getStartedWidget(),
        ],
      ),
    );
  }

  Widget appLogo() {
    return const CustomImageWidget(
      assetName: "assets/images/app_logo.jpeg",
      margin: EdgeInsets.symmetric(vertical: 50),
      height: 150,
      width: 250,
      boxFit: BoxFit.fill,
      alignment: Alignment.center,
    );
  }

  Widget appTextWidget() {
    return CustomTextWidget(
      title: companyNameText,
      textStyle: titleStyle,
      margin: const EdgeInsets.all(10),
      align: TextAlign.center,
    );
  }

  Widget aboutTextWidget() {
    return CustomTextWidget(
      title: companyNameText,
      textStyle: titleStyle,
      margin: const EdgeInsets.all(10),
      align: TextAlign.center,
    );
  }

  Widget appDescTextWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: aboutText,
          style: btnTextStyleBold,
          children: <TextSpan>[
            TextSpan(
              text: companyDescText,
              style: textBoxStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget getStartedWidget() {
    return CustomButton(
      primaryColor: blackColor,
      surfaceColor: Colors.black54,
      buttonTestStyle: btnTextStyle,
      buttonName: getStartedText,
      buttonMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      buttonPadding: EdgeInsets.zero,
      buttonHeight: 45,
      buttonWidth: double.infinity,
      buttonCornerRadius: 10,
      buttonBorderColor: blackColor,
      onPressed: () {
        connectToDB();
      },
      textScaleFactor: 1,
    );
  }

  Future connectToDB() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final response = await ApiBaseHelper.getAPI(
        "http://www.mocky.io/v2/5d565297300000680030a986",
        "",
      );

      if (response.status == Status.COMPLETED) {
        final dbHelper = DatabaseHelper.instance;
        var data = response.data as List;
        List<EmployeeModel> employees =
            data.map((tagJson) => EmployeeModel.fromJson(tagJson)).toList();
        for (var val in employees) {
          dbHelper.insert(val);
        }
        pref.setBool("isLoggedIn", true);
        navigatorKey.currentState!.pushNamed(EmployeeListPage.routeName);
      } else {
        pref.setBool("isLoggedIn", false);
      }
    } catch (e) {
      return null;
    }
  }
}
