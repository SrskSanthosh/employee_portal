import 'package:employee_portal/models/employee_model.dart';
import 'package:employee_portal/pages/pages.dart';
import 'package:employee_portal/styles/styles.dart';

class EmployeeCardWidget extends StatelessWidget {
  final EmployeeModel item;
  const EmployeeCardWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigatorKey.currentState!.pushNamed(EmployeeDetailsPage.routeName,
            arguments: EmployeeDetailsArguments(item: item));
      },
      leading: item.profileImage != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(item.profileImage!),
            )
          : const CircleAvatar(
              backgroundImage: AssetImage("assets/images/app_logo.jpeg"),
            ),
      title: Text(
        item.username.toString(),
        style: btnTextStyleBold,
      ),
      subtitle: Text(
        item.website ?? "",
        style: textBoxStyle,
      ),
    );
  }
}
