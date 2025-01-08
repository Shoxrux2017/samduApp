import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_yaratish_view_model.dart';

class AdabiyotlarRuyxatiYaratishScreenWidget extends StatelessWidget {
  const AdabiyotlarRuyxatiYaratishScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adabiyotlar ro'yxatini yaratish"),
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
    final model = context.read<AdabiyotlarRuyxatiYaratishViewModel>();
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
    final model = context.watch<AdabiyotlarRuyxatiYaratishViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 70),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: model.books.length,
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
    final model = context.read<AdabiyotlarRuyxatiYaratishViewModel>();
    final book = model.books[index];
    final pathImage = book.imageUrl;
    final titleBook = book.bookTitle;
    final publisherBook = book.publisher;
    final publisherDateBook = book.publishDate;
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
                if (pathImage != null) Image.network(pathImage, width: 95),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      if (titleBook != null)
                        Text(
                          titleBook,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 5),
                      if (publisherDateBook != null)
                        Text(
                          publisherDateBook.toString(),
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 50),
                      if (publisherBook != null)
                        Text(
                          publisherBook,
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
          Positioned(
              bottom: -5,
              right: 5,
              child: IconButton(
                onPressed: () => model.toggleFavorite(index),
                icon: Icon(
                  book.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: book.isFavorite ? Colors.red : null,
                ),
              ))
        ],
      ),
    );
  }
}
