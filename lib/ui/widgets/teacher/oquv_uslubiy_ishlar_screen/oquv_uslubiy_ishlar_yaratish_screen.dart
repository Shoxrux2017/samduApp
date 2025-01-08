import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_yaratish_view_model.dart';

class OquvUslubiyIshlarYaratishScreen extends StatelessWidget {
  const OquvUslubiyIshlarYaratishScreen({super.key});

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
              OquvUslubiyIshBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class OquvUslubiyIshBody extends StatelessWidget {
  const OquvUslubiyIshBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          OquvUslubiyIshMain(),
          SizedBox(height: 30),
          UslubiyNashrTuri(),
          SizedBox(height: 30),
          UslubiyNashrTili(),
          SizedBox(height: 30),
          UslubiyNashrYili(),
          SizedBox(height: 30),
          UslubiyNashrOquvYili(),
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

class OquvUslubiyIshMain extends StatelessWidget {
  const OquvUslubiyIshMain({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text('Uslubiy nashrning nomi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyNashrNomiTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Uslubiy nashrning nomi bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Uslubiy nashrning nashriyoti'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshNashriyotiTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Uslubiy ishning nashriyoti bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Uslubiy ishning mualliflari'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshMualliflariTextConroller,
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
        const Text('Mualliflar soni'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshMualliflarSoniTextConroller,
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
        const Text('Nashr parametrlari'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshNashrParametrlariTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Nashr parametrlari bo'sh bo'lishi mumkin emas";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text("Guvohnoma raqami"),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshGuvohnomaRaqamiTextConroller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Guvohnoma raqami";
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        const Text('Guvohnoma sanasi'),
        const SizedBox(height: 10),
        TextFormField(
          controller: model.uslubiyIshGuvohnomaSanasiTextConroller,
          initialValue: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class UslubiyNashrTuri extends StatelessWidget {
  const UslubiyNashrTuri({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();
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
            'Uslubiy nashr turi',
            style: TextStyle(color: Colors.black),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          dropdownColor: Colors.white,
          items: model.uslubiyNashrTuriItems.map((String items) {
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
          value: model.uslubiyNashrTuriItem,
          validator: (value) => value == null
              ? "Uslubiy nashr turi turi bo'sh bo'lishi mumkin emas"
              : null,

          onChanged: modelFunc.uslubiyNashrTuriDropDownCallback,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class UslubiyNashrTili extends StatelessWidget {
  const UslubiyNashrTili({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();

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
            'Uslubiy nashr tili',
            style: TextStyle(color: Colors.black),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          dropdownColor: Colors.white,
          items: model.uslubiyNashrTiliItems.map((String items) {
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
          value: model.uslubiyNashrTiliItem,
          onChanged: modelFunc.uslubiyNashrTiliDropDownCallback,
          validator: (value) => value == null
              ? "Uslubiy nashr tili bo'sh bo'lishi mumkin emas"
              : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class UslubiyNashrYili extends StatelessWidget {
  const UslubiyNashrYili({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();
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
            'Uslubiy nashr yili',
            style: TextStyle(color: Colors.black),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          dropdownColor: Colors.white,
          items: model.nashrYiliItems.map((String items) {
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
          value: model.nashrYiliItem,
          onChanged: modelFunc.uslubiyNashrYiliDropDownCallback,
          validator: (value) => value == null
              ? "Uslubiy nashr yili bo'sh bo'lishi mumkin emas"
              : null,
          decoration: const InputDecoration(border: InputBorder.none),
          isExpanded: true, //make true to make width 100%
        ),
      ),
    );
  }
}

class UslubiyNashrOquvYili extends StatelessWidget {
  const UslubiyNashrOquvYili({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();
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
          items: model.oquvYiliItems.map((String items) {
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
          value: model.oquvYiliItem,
          onChanged: modelFunc.uslubiyNashrOquvYiliDropDownCallback,
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
    final model = context.watch<OquvUslubiyIshlarYaratishViewModel>();
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();
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
    final modelFunc = context.read<OquvUslubiyIshlarYaratishViewModel>();
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
