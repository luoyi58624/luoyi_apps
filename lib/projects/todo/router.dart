import 'package:get/get.dart';
import 'pages/root/root_page.dart';
import 'pages/calendar/calendar_page.dart';
import 'pages/user/user_page.dart';
import 'pages/task/add_task_page.dart';

abstract class TodoRoutes {
  static const root = '/todo';
  static const calendar = '$root/calendar';
  static const user = '$root/user';
  static const addTask = '$root/addTask';
}

abstract class TodoPages {
  static final pages = [
    GetPage(
      name: TodoRoutes.root,
      page: () => RootPage(),
    ),
    GetPage(
      name: TodoRoutes.calendar,
      page: () => const CalendarPage(),
    ),
    GetPage(
      name: TodoRoutes.user,
      page: () => const UserPage(),
    ),
    GetPage(
      name: TodoRoutes.addTask,
      page: () => const AddTaskPage(),
      binding: AddTaskBinding(),
    )
  ];
}
