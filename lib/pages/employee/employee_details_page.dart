import 'package:employee_portal/models/employee_model.dart';
import 'package:employee_portal/styles/styles.dart';
import 'package:employee_portal/widget/widgets.dart';

@immutable
class EmployeeDetailsArguments {
  const EmployeeDetailsArguments({
    required this.item,
  });
  final EmployeeModel item;
}

class EmployeeDetailsPage extends StatefulWidget {
  static const String routeName = '/employee_details';
  const EmployeeDetailsPage({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  late EmployeeDetailsArguments args;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    args =
        ModalRoute.of(context)!.settings.arguments as EmployeeDetailsArguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text("Employee Details")),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: "Employee Personal Details",
              textStyle: titleStyle,
              margin: const EdgeInsets.all(5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: args.item.profileImage != null
                  ? Image.network(args.item.profileImage!)
                  : Image.asset("assets/images/app_logo.jpeg"),
            ),
            CustomTextWidget(
              title: "Name",
              textStyle: btnTextStyleBold,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: args.item.name ?? "",
              textStyle: textBoxStyle,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: "User Name",
              textStyle: btnTextStyleBold,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: args.item.username ?? "",
              textStyle: textBoxStyle,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: "Email",
              textStyle: btnTextStyleBold,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: args.item.email ?? "",
              textStyle: textBoxStyle,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: "Phone Number",
              textStyle: btnTextStyleBold,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: args.item.phone ?? "",
              textStyle: textBoxStyle,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: "Company Website",
              textStyle: btnTextStyleBold,
              margin: const EdgeInsets.all(5),
            ),
            CustomTextWidget(
              title: args.item.website ?? "",
              textStyle: textBoxStyle,
              margin: const EdgeInsets.all(5),
            ),
          ],
        ),
      ),
    );
  }
}
