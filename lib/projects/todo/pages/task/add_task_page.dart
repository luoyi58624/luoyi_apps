import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/common/extension/date_extension.dart';

class AddTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
  }
}

class AddTaskController extends GetxController {
  final formKey = GlobalKey<FormState>();

  /// 局部更新id
  final String updateDateId = 'update_date';
  final String updatePriorityId = 'update_priority';

  /// 日期
  final dateTimeController =
      TextEditingController(text: DateTime.now().format());

  String title = '';
  String content = '';
  late DateTime dateTime;

  void saveTitle(String? value) {
    title = value ?? '';
  }

  void saveContent(String? value) {
    content = value ?? '';
  }

  void handleDatePicker() async {
    final datePick = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2000),
        initialDate: dateTime,
        lastDate: DateTime(2100));
    if (datePick != null && datePick != dateTime) {
      dateTime = datePick;
      dateTimeController.text = dateTime.format();
      update([updateDateId]);
    }
  }
}

class AddTaskPage extends GetView<AddTaskController> {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新增任务'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                buildTitleField(),
                const SizedBox(
                  height: 20,
                ),
                buildDescriptionField(),
                const SizedBox(
                  height: 20,
                ),
                buildDateTimeField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// title输入框
  Widget buildTitleField() {
    return TextFormField(
      validator: (value) =>
          value!.trim().isEmpty ? 'Please enter atask title' : null,
      onSaved: controller.saveTitle,
      decoration: InputDecoration(
          labelText: '标题',
          labelStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  /// Description输入框
  Widget buildDescriptionField() {
    return TextFormField(
      onSaved: controller.saveContent,
      maxLines: 6,
      decoration: InputDecoration(
          labelText: '内容',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  /// 时间选择器
  Widget buildDateTimeField() {
    return GetBuilder<AddTaskController>(
      init: controller,
      id: controller.updateDateId,
      builder: (_) {
        return TextFormField(
          readOnly: true,
          onTap: _.handleDatePicker,
          controller: _.dateTimeController,
          decoration: InputDecoration(
              labelText: '日期',
              labelStyle: const TextStyle(fontSize: 18),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        );
      },
    );
  }
}
