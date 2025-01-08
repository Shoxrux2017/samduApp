import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_kurish_view_model.dart';

class AdabiyotlarRuyxatiKurishScreenWidget extends StatefulWidget {
  const AdabiyotlarRuyxatiKurishScreenWidget({super.key});

  @override
  State<AdabiyotlarRuyxatiKurishScreenWidget> createState() =>
      _AdabiyotlarRuyxatiKurishScreenWidgetState();
}

class _AdabiyotlarRuyxatiKurishScreenWidgetState
    extends State<AdabiyotlarRuyxatiKurishScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<AdabiyotlarRuyxatiKurishViewModel>().initAsync(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adabiyotlar ro'yxati"),
        centerTitle: true,
      ),
      body: const Stack(
        children: [
          _AdabiyotlarRuyxatiWidget(),
          _SearchWidget(),
        ],
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<AdabiyotlarRuyxatiKurishViewModel>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
          onChanged: model.searchBooks,
          decoration: InputDecoration(
            labelText: 'Поиск',
            filled: true,
            fillColor: Colors.white.withAlpha(235),
            border: const OutlineInputBorder(),
          )),
    );
  }
}

class _AdabiyotlarRuyxatiWidget extends StatelessWidget {
  const _AdabiyotlarRuyxatiWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AdabiyotlarRuyxatiKurishViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 70),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: model.filteredBooks.length,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        // model.showedMovieAtIndex(index);
        return _AdabiyotlarRuyxatiRowWIdget(index: index);
      },
    );
  }
}

class _AdabiyotlarRuyxatiRowWIdget extends StatelessWidget {
  final int index;
  const _AdabiyotlarRuyxatiRowWIdget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AdabiyotlarRuyxatiKurishViewModel>();
    final book = model.filteredBooks[index];
    // final stateIcon = context
    //     .select((AdabiyotlarRuyxatiKurishViewModel model) => model.books);
    final pathBookImg = book.imageUrl;
    final title = book.bookTitle ?? '';
    final desc = book.bookDescription ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                if (pathBookImg != null) Image.network(pathBookImg, width: 95),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (book.publishDate).toString(),
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () => model.onMovieTap(index),
            ),
          ),
        ],
      ),
    );
  }
}
