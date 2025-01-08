import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/kafedra_screen/kafedra_screen_view_model.dart';

class KafedraScreenWidget extends StatefulWidget {
  const KafedraScreenWidget({super.key});

  @override
  State<KafedraScreenWidget> createState() => _KafedraScreenWidgetState();
}

class _KafedraScreenWidgetState extends State<KafedraScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Future.microtask(
    //   () => context.read<KafedraScreenViewModel>().getKafedraAll(context),
    // );
    context.read<KafedraScreenViewModel>().getKafedraAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kafedra'),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: _BodyWidget(),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<KafedraScreenViewModel>();
    return ListView.builder(
      itemCount: model.kafedraList.length,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemExtent: 110,
      itemBuilder: (BuildContext context, int index) {
        return _KafedraListRowWidget(index: index);
      },
    );
  }
}

class _KafedraListRowWidget extends StatelessWidget {
  final int index;
  const _KafedraListRowWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<KafedraScreenViewModel>();
    final kafedraList = model.kafedraList;
    final kafedra = kafedraList[index];
    return Card(
      child: InkWell(
        onTap: () => model.onKafedraTap(context, index),
        splashColor: Colors.blue,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              kafedra.title,
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
