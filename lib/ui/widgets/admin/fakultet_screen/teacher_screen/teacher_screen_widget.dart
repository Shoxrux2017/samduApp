import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/teacher_screen/teacher_screen_view_model.dart';

class TeacherScreenWidet extends StatefulWidget {
  const TeacherScreenWidet({super.key});

  @override
  State<TeacherScreenWidet> createState() => _TeacherScreenWidetState();
}

class _TeacherScreenWidetState extends State<TeacherScreenWidet> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Future.microtask(
    //   () => context.read<KafedraScreenViewModel>().getKafedraAll(context),
    // );
    context.read<TeacherScreenViewModel>().getTeacherAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kafedra o'qituvchilari"),
        backgroundColor: Colors.blue,
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TeacherScreenViewModel>();
    return ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemExtent: 110,
        itemCount: model.teacherList.length,
        itemBuilder: (BuildContext context, int index) {
          return _TeacherListRowWidget(index: index);
        });
  }
}

class _TeacherListRowWidget extends StatelessWidget {
  final int index;
  const _TeacherListRowWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<TeacherScreenViewModel>();
    final teacherList = model.teacherList;
    final teacher = teacherList[index];
    return Card(
      child: InkWell(
        onTap: () => model.onTeacherTap(context, index),
        splashColor: Colors.blue,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              teacher.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Avenir",
                  color: Colors.black,
                  height: 1.2,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
