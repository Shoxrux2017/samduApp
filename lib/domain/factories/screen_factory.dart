import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/auth_screen/login_view_model.dart';
import 'package:samduapp/ui/widgets/auth_screen/login_widget.dart';
import 'package:samduapp/ui/widgets/auth_screen/registration_view_model.dart';
import 'package:samduapp/ui/widgets/auth_screen/registration_widget.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/fakultet_screen_view_model.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/fakultet_screen_widget.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/kafedra_screen/kafedra_screen_view_model.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/kafedra_screen/kafedra_screen_widget.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/teacher_screen/teacher_screen_view_model.dart';
import 'package:samduapp/ui/widgets/admin/fakultet_screen/teacher_screen/teacher_screen_widget.dart';
import 'package:samduapp/ui/widgets/loader_screen/loader_view_model.dart';
import 'package:samduapp/ui/widgets/loader_screen/loader_widget.dart';
import 'package:samduapp/ui/widgets/admin/admin_main_screen_widget.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_kurish_screen_widget.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_kurish_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_yaratish_screen_widget.dart';
import 'package:samduapp/ui/widgets/teacher/adabiyotlar_ruyxati_screen/adabiyotlar_ruyxati_yaratish_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_details_screen.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_details_view_model.dart';

// import 'package:samduapp/ui/widgets/teacher/anketa_screen/shaxsiy_malumotlar_screen/shaxsiy_malumotlar_screen_widget.dart';

import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_screen.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_yaratish_screen.dart';
import 'package:samduapp/ui/widgets/teacher/ilmiy_ishlar_screen/ilmiy_ishlar_yaratish_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_screen.dart';
import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_yaratish_screen.dart';
import 'package:samduapp/ui/widgets/teacher/oquv_uslubiy_ishlar_screen/oquv_uslubiy_ishlar_yaratish_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/teacher_main_screen_view_model.dart';
import 'package:samduapp/ui/widgets/teacher/teacher_main_screen_widget.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/pdf_viewer.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/pdf_viewer_model.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/yuklama_screen_widget.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/yuklama_view_model.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeLogin() {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginWidget(),
    );
  }

  Widget makeRegistration() {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: const RegistrationWidget(),
    );
  }

  Widget makeMainTeacherScreen() {
    return ChangeNotifierProvider(
      create: (_) => TeacherMainScreenViewModel(),
      child: const TeacherMainScreenWidget(),
    );
  }

  Widget makeYuklamaScreen() {
    return ChangeNotifierProvider(
      create: (_) => YuklamaViewModel(),
      child: const YuklamaScreenWidget(),
    );
  }

  Widget makeAdabiyotlarRuyxatiYaratishScreen() {
    return ChangeNotifierProvider(
      create: (_) => AdabiyotlarRuyxatiYaratishViewModel(),
      child: const AdabiyotlarRuyxatiYaratishScreenWidget(),
    );
  }

  Widget makeAdabiyotlarRuyxatiKurishScreen() {
    return ChangeNotifierProvider(
      create: (_) => AdabiyotlarRuyxatiKurishViewModel(),
      child: const AdabiyotlarRuyxatiKurishScreenWidget(),
    );
  }

  // Widget makeIlmiyIshlarScreenScreen(teacherId) {
  //   return ChangeNotifierProvider(
  //     create: (_) => IlmiyIshlarScreenViewModel(teacherId),
  //     child: const IlmiyIshlarScreenWidget(),
  //   );
  // }

  // Widget makeOquvUslubiyIshlarScreenScreen(teacherId) {
  //   return ChangeNotifierProvider(
  //     create: (_) => OquvUslubiyIshlarScreenViewModel(teacherId),
  //     child: const OquvUslubiyIshlarScreenWidget(),
  //   );
  // }

  // Widget makeShaxsiyMalumotlarScreen() {
  //   return const ShaxsiyMalumotlarScreenWidget();
  // }

  Widget makeAdminScreen() {
    return const AdminMainScreenWidget();
  }

  Widget makeFakultetScreen() {
    return ChangeNotifierProvider(
      create: (_) => FakultetScreenViewModel(),
      child: const FakultetScreenWidget(),
    );
  }

  Widget makeKafedraScreen(fakultetId) {
    return ChangeNotifierProvider(
      create: (_) => KafedraScreenViewModel(fakultetId),
      child: const KafedraScreenWidget(),
    );
  }

  Widget makeTeacherScreen(kafedraId) {
    return ChangeNotifierProvider(
      create: (_) => TeacherScreenViewModel(kafedraId),
      child: const TeacherScreenWidet(),
    );
  }

  Widget makePdfScreen(pdfUrl) {
    return ChangeNotifierProvider(
      create: (_) => PdfViewerModel(pdfUrl),
      child: const PdfViewer(),
    );
  }

  // -------------------------NEW STRUCTURE ------------------------------ //

  Widget makeIlmiyIshlarScreen() {
    return ChangeNotifierProvider(
      create: (_) => IlmiyIshlarViewModel(),
      child: const IlmiyIshlarScreen(),
    );
  }

  Widget makeIlmiyIshlarYaratishScreen() {
    return ChangeNotifierProvider(
      create: (_) => IlmiyIshlarYaratishViewModel(),
      child: const IlmiyIshlarYaratishScreen(),
    );
  }

  Widget makeIlmiyIshlarDetailsScreen(String scienceTitle) {
    return ChangeNotifierProvider(
      create: (_) => IlmiyIshlarDetailsViewModel(scienceTitle),
      child: const IlmiyIshlarDetailsScreen(),
    );
  }

  Widget makeOquvUslubiyIshlarScreen() {
    return ChangeNotifierProvider(
      create: (_) => OquvUslubiyIshlarViewModel(),
      child: const OquvUslubiyIshlarScreen(),
    );
  }

  Widget makeOquvUslubiyIshlarYaratish() {
    return ChangeNotifierProvider(
      create: (_) => OquvUslubiyIshlarYaratishViewModel(),
      child: const OquvUslubiyIshlarYaratishScreen(),
    );
  }
}
