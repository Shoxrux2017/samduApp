import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_view_model.dart';

class OquvUslubiyIshlarScreen extends StatelessWidget {
  const OquvUslubiyIshlarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarViewModel>();
    final test = context
        .select((OquvUslubiyIshlarViewModel model) => model.showHelpfulPage);
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                const _IlmiyIshlarRuyxatiWidget(),
                const _SearchWidget(),
                if (test) const _FilterBodyWidget(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => model.onMovieTap(context),
            child: const Icon(Icons.add_circle),
          )),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<OquvUslubiyIshlarViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarViewModel>();
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 140,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: model.searchingQueryTextConroller,
              onChanged: model.onChangedCase,
              decoration: InputDecoration(
                labelText: 'Поиск',
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 50,
                child: GFButton(
                  onPressed: model.searchScienceWorks,
                  child: const Text('Qidirish'),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 50,
                child: GFButton(
                  fullWidthButton: true,
                  onPressed: modelFunc.closeOrOpenFilterWindow,
                  child: const Text('Filter'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _FilterBodyWidget extends StatelessWidget {
  const _FilterBodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarViewModel>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: const Text('Filter'),
            // subtitle: const Text('Trailing expansion arrow icon'),
            collapsedBackgroundColor: Colors.grey[100],
            childrenPadding: const EdgeInsets.only(left: 20),
            children: [
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Uslubiy nashr turi',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.uslubiyNashrTurlari.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                style: const TextStyle(
                    //te
                    color: Colors.black, //Font color
                    fontSize: 20 //font size on dropdown button
                    ),
                value: model.uslubiyNashrTuri,
                validator: (value) => value == null
                    ? "Uslubiy nashr turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.uslubiyNashrTuriDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Uslubiy nashr tili',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.uslubiyNashrTillari.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                style: const TextStyle(
                    //te
                    color: Colors.black, //Font color
                    fontSize: 20 //font size on dropdown button
                    ),
                value: model.uslubiyNashrTili,
                validator: (value) => value == null
                    ? "Uslubiy nashr tili bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.uslubiyNashrTiliDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Uslubiy nashr yili',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.uslubiyNashrYillari.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                style: const TextStyle(
                    //te
                    color: Colors.black, //Font color
                    fontSize: 20 //font size on dropdown button
                    ),
                value: model.uslubiyNashrYili,
                validator: (value) => value == null
                    ? "Uslubiy nashr yili bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.uslubiyNashrYiliDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  "Uslubiy nashr o'quv yili",
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.uslubiyNashrOquvYillari.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                style: const TextStyle(
                    //te
                    color: Colors.black, //Font color
                    fontSize: 20 //font size on dropdown button
                    ),
                value: model.uslubiyNashrOquvYili,
                validator: (value) => value == null
                    ? "Uslubiy nashr o'quv yili bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.uslubiyNashrOquvYiliDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: modelFunc.searchFilter,
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: modelFunc.resetFilter,
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IlmiyIshlarRuyxatiWidget extends StatelessWidget {
  const _IlmiyIshlarRuyxatiWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarViewModel>();
    return Container(
      margin: const EdgeInsets.only(top: 130),
      padding: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: model.resultList.length,
        itemBuilder: (BuildContext context, int index) {
          // model.showedMovieAtIndex(index);
          return _IlmiyIshlarRuyxatiRowWIdget(index: index);
        },
      ),
    );
  }
}

class _IlmiyIshlarRuyxatiRowWIdget extends StatelessWidget {
  final int index;
  const _IlmiyIshlarRuyxatiRowWIdget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<OquvUslubiyIshlarViewModel>();
    final scienceWork = model.resultList[index];
    final title = scienceWork.uslubiyNashrNomi;
    final authors = scienceWork.mualliflar;
    final publish = scienceWork.nashriyot;
    final scienceCategory = scienceWork.uslubiyNashrTuri;
    final numberWorks = index + 1;
    final publishYear = '${scienceWork.nashrYili}yil';
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            width: MediaQuery.of(context).size.width,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        '$numberWorks. $title',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Ilmiy nashriyot: $publish',
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Ilmiy nashriyot turi: $scienceCategory',
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Mualliflar: $authors',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Nashr yili: $publishYear',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
