import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_yaratish_view_model.dart';

class IlmiyIshlarYaratishScreen extends StatelessWidget {
  const IlmiyIshlarYaratishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Ilmiy ishlar yaratish'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              IlmiyIshBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class IlmiyIshBody extends StatelessWidget {
  const IlmiyIshBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          IlmiyIshMain(),
          SizedBox(height: 30),
          CategoryScience(),
          SizedBox(height: 30),
          PublishType(),
          SizedBox(height: 30),
          PublishLevel(),
          SizedBox(height: 30),
          PublishLanguage(),
          SizedBox(height: 30),
          StudyYear(),
          SizedBox(height: 30),
          FileDownload(),
          SizedBox(height: 30),
          SaveButton(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class IlmiyIshMain extends StatelessWidget {
  const IlmiyIshMain({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text('Ilmiy ishning nomi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.nameTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Ilmiy ishning nomi bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Ilmiy ishning nashriyoti'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.publishTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Ilmiy ishning nashriyoti bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Ilmiy ishning yili'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.yearTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Ilmiy ishning yili bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Ilmiy ishning beti'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.pageTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Ilmiy ishning beti bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Ilmiy ishning muallifi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.authorTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Mualliflar bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Ilmiy ishning hammuallifi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.coAuthorTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Mualliflar soni'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.authorCountTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Mualliflar soni bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Doi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.doiTextConroller,
          initialValue: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class CategoryScience extends StatelessWidget {
  const CategoryScience({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            //border of dropdown button
            borderRadius:
                BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: DropdownButtonFormField<String>(
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
      ),
    );
  }
}

class PublishType extends StatelessWidget {
  const PublishType({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            //border of dropdown button
            borderRadius:
                BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: DropdownButtonFormField<String>(
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
          onChanged: modelFunc.publishTyperadioCallback,
          validator: (value) => value == null
              ? "Ilmiy nash turi bo'sh bo'lishi mumkin emas"
              : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class PublishLevel extends StatelessWidget {
  const PublishLevel({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            //border of dropdown button
            borderRadius:
                BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: DropdownButtonFormField<String>(
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
          onChanged: modelFunc.publishLevelDropDownCallback,
          validator: (value) => value == null
              ? "Xalqaro ilmiy baza bo'sh bo'lishi mumkin emas"
              : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class PublishLanguage extends StatelessWidget {
  const PublishLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            //border of dropdown button
            borderRadius:
                BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: DropdownButtonFormField<String>(
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
          onChanged: modelFunc.publishLanguageDropDownCallback,
          validator: (value) => value == null
              ? "Ilmiy nashrning tili bo'sh bo'lishi mumkin emas"
              : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class StudyYear extends StatelessWidget {
  const StudyYear({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            //border of dropdown button
            borderRadius:
                BorderRadius.circular(10), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: DropdownButtonFormField<String>(
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
          onChanged: modelFunc.studyYearDropDownCallback,
          validator: (value) =>
              value == null ? "O‘quv yili bo'sh bo'lishi mumkin emas" : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class FileDownload extends StatelessWidget {
  const FileDownload({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<IlmiyIshlarYaratishViewModel>();
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    final posterPath = model.platformFile;
    return GestureDetector(
      onTap: modelFunc.selectFile,
      child: Column(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [10, 4],
                strokeCap: StrokeCap.round,
                color: Colors.blue.shade400,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.folder_open,
                        color: Colors.blue,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Select your file',
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
              )),
          model.platformFile != null
              ? Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected File',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                )
                              ]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/folder.png',
                                  width: 70,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.platformFile!.name,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${(model.platformFile!.size / 1024).ceil()} KB',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          )),
                      const SizedBox(height: 20),
                    ],
                  ))
              : Container(),
          model.platformFileEror
              ? const Text(
                  'Faylni yuklang',
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final modelFunc = context.read<IlmiyIshlarYaratishViewModel>();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () => modelFunc.uploadIlmiyIsh(context),
        child: const Text("Saqlash"));
  }
}
