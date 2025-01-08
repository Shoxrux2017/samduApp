import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/fakultet_screen_view_model.dart';

class FakultetScreenWidget extends StatefulWidget {
  const FakultetScreenWidget({super.key});

  @override
  State<FakultetScreenWidget> createState() => _FakultetScreenWidgetState();
}

class _FakultetScreenWidgetState extends State<FakultetScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Future.microtask(
    //   () => context.read<FakultetScreenViewModel>().getFakultetAll(context),
    // );
    context.read<FakultetScreenViewModel>().getFakultetAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FakultetScreenViewModel>();
    return GridView.builder(
      itemCount: model.fakultetList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2.0)),
      itemBuilder: (BuildContext context, int index) {
        return _FakultetListRowWidget(index: index);
      },
    );
  }
}

class _FakultetListRowWidget extends StatelessWidget {
  final int index;
  const _FakultetListRowWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<FakultetScreenViewModel>();
    final fakultetList = model.fakultetList;
    final imageList = model.images;
    final fakultet = fakultetList[index];
    return Card(
      child: InkWell(
        onTap: () => model.onFakultetTap(context, index),
        splashColor: Colors.blue,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            imageList[index],
            height: 64,
            width: 64,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              fakultet.title,
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
