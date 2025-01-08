import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/domain/api_client/image_downloader.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_details_view_model.dart';

class IlmiyIshlarDetailsScreen extends StatelessWidget {
  const IlmiyIshlarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adabiyotlar ro'yxati"),
        centerTitle: true,
      ),
      body: const Stack(
        children: [
          _IlmiyIshlarRuyxatiWidget(),
        ],
      ),
    );
  }
}

class _IlmiyIshlarRuyxatiWidget extends StatelessWidget {
  const _IlmiyIshlarRuyxatiWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarDetailsViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 70),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: model.scienceWorks.length,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        // model.showedMovieAtIndex(index);
        return _IlmiyIshlarRuyxatiRowWIdget(index: index);
      },
    );
  }
}

class _IlmiyIshlarRuyxatiRowWIdget extends StatelessWidget {
  final int index;
  const _IlmiyIshlarRuyxatiRowWIdget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<IlmiyIshlarDetailsViewModel>();
    final book = model.scienceWorks[index];
    // final stateIcon = context
    //     .select((AdabiyotlarRuyxatiKurishViewModel model) => model.books);
    final pathBookImg = book.filePath;
    final title = book.title;

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
                Image.asset(
                  'assets/images/folder.png',
                  width: 70,
                ),
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
                        (book.year).toString(),
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        book.author,
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
        ],
      ),
    );
  }
}
