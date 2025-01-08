import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_view_model.dart';

class IlmiyIshlarScreen extends StatelessWidget {
  const IlmiyIshlarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarViewModel>();
    final test =
        context.select((IlmiyIshlarViewModel model) => model.showHelpfulPage);
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
            onPressed: () => model.onMovieTap(context),
            heroTag: "btn1",
            child: const Icon(Icons.add_circle),
          )),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<IlmiyIshlarViewModel>();
    final modelFunc = context.read<IlmiyIshlarViewModel>();
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 140,
      color: Colors.grey[100],
      child: Column(
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
    final model = context.watch<IlmiyIshlarViewModel>();
    final modelFunc = context.read<IlmiyIshlarViewModel>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView(
        children: [
          ExpansionTile(
            title: const Text('Filter'),
            // subtitle: const Text('Trailing expansion arrow icon'),
            collapsedBackgroundColor: Colors.grey[100],
            childrenPadding: const EdgeInsets.only(left: 20),
            children: [
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Ilmiy nashr turi',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.categoryScienceItems.map((String items) {
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
                value: model.categoryScienceItem,
                validator: (value) => value == null
                    ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.categoryScienceDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Ilmiy nashr turi',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.publishTypeItems.map((String items) {
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
                value: model.publishTypeItem,
                validator: (value) => value == null
                    ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.publishTyperadioCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Xalqaro ilmiy bazalar',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.publishLevelItems.map((String items) {
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
                value: model.publishLevelItem,
                validator: (value) => value == null
                    ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.publishLevelDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  'Til',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.publishLanguageItems.map((String items) {
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
                value: model.publishLanguageItem,
                validator: (value) => value == null
                    ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.publishLanguageDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
              DropdownButtonFormField<String>(
                padding: const EdgeInsets.all(10.0),
                hint: const Text(
                  "O'quv yili",
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                items: model.studyYearItems.map((String items) {
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
                value: model.studyYearItem,
                validator: (value) => value == null
                    ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                    : null,

                onChanged: modelFunc.studyYearDropDownCallback,
                decoration: const InputDecoration(border: InputBorder.none),
                isExpanded: true, //make true to make width 100%
              ),
            ],
          ),
          ExpansionTile(
              title: const Text('Sorted by'),
              collapsedBackgroundColor: Colors.grey[100],
              childrenPadding: const EdgeInsets.only(left: 20),
              // subtitle: const Text('Trailing expansion arrow icon'),
              children: [
                DropdownButtonFormField<String>(
                  padding: const EdgeInsets.all(10.0),
                  hint: const Text(
                    'Ilmiy nashrning yili',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  items: model.scienceWorksYear.map((String items) {
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
                  value: model.scienceWorkYear,
                  validator: (value) => value == null
                      ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                      : null,

                  onChanged: model.sortingYearDropDownCallback,
                  decoration: const InputDecoration(border: InputBorder.none),
                  isExpanded: true, //make true to make width 100%
                ),
                DropdownButtonFormField<String>(
                  padding: const EdgeInsets.all(10.0),
                  hint: const Text(
                    'Ilmiy nashrning sahifalari soni',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  items: model.scienceWorksPage.map((String items) {
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
                  value: model.scienceWorkPage,
                  validator: (value) => value == null
                      ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                      : null,

                  onChanged: modelFunc.sortingPageDropDownCallback,
                  decoration: const InputDecoration(border: InputBorder.none),
                  isExpanded: true, //make true to make width 100%
                ),
                DropdownButtonFormField<String>(
                  padding: const EdgeInsets.all(10.0),
                  hint: const Text(
                    'Ilmiy nashrning mualliflari soni',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  items: model.scienceWorksAuthorCount.map((String items) {
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
                  value: model.scienceWorkAuthorCount,
                  validator: (value) => value == null
                      ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
                      : null,

                  onChanged: modelFunc.sortingAuthorCountDropDownCallback,
                  decoration: const InputDecoration(border: InputBorder.none),
                  isExpanded: true, //make true to make width 100%
                ),
              ]),
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
    final model = context.watch<IlmiyIshlarViewModel>();
    return Container(
      margin: const EdgeInsets.only(top: 130),
      padding: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: model.resultList.length,
        itemExtent: 230,
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
    final model = context.read<IlmiyIshlarViewModel>();
    final scienceWork = model.resultList[index];
    final title = scienceWork.title;
    final authors = scienceWork.author + (scienceWork.coAuthor ?? '');
    final publish = scienceWork.publish;
    final scienceCategory = scienceWork.scienceCategory;
    final numberWorks = index + 1;
    final publishYear = '${scienceWork.year}yil';
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width * 1,
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
