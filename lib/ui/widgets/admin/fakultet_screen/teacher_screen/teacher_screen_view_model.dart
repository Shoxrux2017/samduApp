import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/teacher.dart';
import 'package:samduapp/domain/services/teacher_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class TeacherScreenViewModel extends ChangeNotifier {
  final int kafedraId;
  final _teacherService = TeacherService();

  final _teacherList = <Teacher>[];

  List<Teacher> get teacherList => _teacherList;

  TeacherScreenViewModel(this.kafedraId);

  Future<void> getTeacherAll(BuildContext context) async {
    final teacherResponse = await _teacherService.loadTeacher(kafedraId);
    _teacherList.addAll(teacherResponse.teacher);
    notifyListeners();
  }

  Future<void> onTeacherTap(BuildContext context, index) async {
    final teacherId = _teacherList[index].id;
    _teacherService.setTeacherId(_teacherList[index].id);
    print("Bu teacherId: $teacherId");
    Navigator.of(context).pushNamed(MainNavigationRouteNames.mainTeacherScreen);
  }
}
