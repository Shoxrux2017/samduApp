import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/yuklama_view_model.dart';

class YuklamaScreenWidget extends StatefulWidget {
  const YuklamaScreenWidget({super.key});

  @override
  State<YuklamaScreenWidget> createState() => _YuklamaScreenWidgetState();
}

class _YuklamaScreenWidgetState extends State<YuklamaScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<YuklamaViewModel>().initAsync(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<YuklamaViewModel>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: model.refreshInfo,
        child: ListView(children: const [
          Column(
            children: [
              _IshchiOquvReja(),
              _FanningNamunaviyOquvDastur(),
              _FanningSillabusi(),
              _AdabiyotlarRuyxati(),
            ],
          ),
        ]),
      ),
    );
  }
}

class _IshchiOquvReja extends StatelessWidget {
  const _IshchiOquvReja();

  @override
  Widget build(BuildContext context) {
    final model = context.read<YuklamaViewModel>();

    final buttonState = context.select((YuklamaViewModel v) => v.stateYuklama)
        ? const Text('Yuklab olish', style: TextStyle(color: Colors.black))
        : const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          );
    final funcState =
        context.select((YuklamaViewModel value) => value.stateYuklamaButton)
            ? null
            : model.downloadYuklama;
    final status = context.select((YuklamaViewModel value) => value.status);
    Widget resultStatus = status == 'teacher'
        ? TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
            ),
            onPressed: funcState,
            child: buttonState,
          )
        : Container();
    return Card(
      color: Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'assets/images/yuklama.jpg',
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "O'qituvchining o'quv yuklamasi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning o'quv rejasi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: () => model.onMovieTapYuklama(context),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    resultStatus
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}

class _FanningNamunaviyOquvDastur extends StatelessWidget {
  const _FanningNamunaviyOquvDastur();

  @override
  Widget build(BuildContext context) {
    final model = context.read<YuklamaViewModel>();
    final buttonState =
        context.select((YuklamaViewModel value) => value.stateNamunaviy)
            ? "O'chirish"
            : 'Yuklash';
    final funcState =
        context.select((YuklamaViewModel value) => value.stateNamunaviyButton)
            ? model.pickNamunaviyFile
            : model.deleteNamunaviy;
    final status = context.select((YuklamaViewModel value) => value.status);
    Widget resultStatus = status == 'teacher'
        ? TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
            ),
            onPressed: funcState,
            child: Text(
              buttonState,
              style: const TextStyle(color: Colors.black),
            ),
          )
        : Container();
    return Card(
      color: Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'assets/images/namunaviy.jpg',
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Fanning namunaviy o'quv dasturi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning Namunaviy o'quv dasturi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: () => model.onMovieTapNamunaviy(context),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    resultStatus
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}

class _FanningSillabusi extends StatelessWidget {
  const _FanningSillabusi();

  @override
  Widget build(BuildContext context) {
    final model = context.read<YuklamaViewModel>();
    final buttonState =
        context.select((YuklamaViewModel value) => value.stateSillabus)
            ? "O'chirish"
            : 'Yuklash';

    final funcState =
        context.select((YuklamaViewModel value) => value.stateSillabusButton)
            ? model.pickSillabusFile
            : model.deleteSillabus;
    final status = context.select((YuklamaViewModel value) => value.status);
    Widget resultStatus = status == 'teacher'
        ? TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
            ),
            onPressed: funcState,
            child: Text(
              buttonState,
              style: const TextStyle(color: Colors.black),
            ),
          )
        : Container();
    return Card(
      color: Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'assets/images/sillabus.jpg',
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Fanning sillabusi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning Sillabusi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: () => model.onMovieTapSillabus(context),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    resultStatus
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}

class _AdabiyotlarRuyxati extends StatelessWidget {
  const _AdabiyotlarRuyxati();

  @override
  Widget build(BuildContext context) {
    final model = context.read<YuklamaViewModel>();
    final status = context.select((YuklamaViewModel value) => value.status);
    Widget resultStatus = status == 'teacher'
        ? TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.transparent,
            ),
            onPressed: () =>
                model.goToScreenAdabiyotlarRuyxatiYaratish(context),
            child: const Text(
              'Yaratish',
              style: TextStyle(color: Colors.black),
            ),
          )
        : Container();
    return Card(
      color: Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'assets/images/sillabus_adabiyotlar_ruyxati.jpg',
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Adabiyotlar ro'yxati",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Sillabusning adabiyotlar ro'yxati",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () =>
                          model.goToScreenAdabiyotlarRuyxatiKurish(context),
                    ),
                    resultStatus
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}
