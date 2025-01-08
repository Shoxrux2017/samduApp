import 'package:flutter/material.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const login = '/login';
  static const registration = '/registration';

  static const mainTeacherScreen = '/main_teacher_screen';

  static const yuklamaScreen = '$mainTeacherScreen/yuklama_screen';

  static const pdfScreen = '$yuklamaScreen/pdf_screen';

  static const adabiyotlarRuyxatiYaratishScreen =
      '$yuklamaScreen/adabiyotlar_ruyxati_yaratish_screen';
  static const adabiyotlarRuyxatiKurishScreen =
      '$yuklamaScreen/adabiyotlar_ruyxati_kurish_screen';

  static const ilmiyIshlar = '$mainTeacherScreen/ilmiy_ishlar_screen';

  static const ilmiyIshlarYaratish =
      '$ilmiyIshlar/ilmiy_ishlar_yaratish_screen';

  static const oquvUslubiyIshlar =
      '$mainTeacherScreen/oquv_uslubiy_ishlar_screen';

  static const oquvUslubiyIshlarYaratish =
      '$oquvUslubiyIshlar/oquv_uslubiy_ishlar_yaratish_screen';

  static const mainAdminScreen = '/main_admin_screen';
  static const fakultetScreen = '$mainAdminScreen/fakultet_screen';
  static const kafedraScreen = '$fakultetScreen/kafedra_screen';
  static const teacherScreen = '$kafedraScreen/teacher_screen';
  // static const adminTeacherScreen = '$teacherScreen/admin_teacher_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext context)>{
    // ---------- Loader screen route ------------------//

    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),

    // ---------- Login va registratsikya screen route ------------------//

    MainNavigationRouteNames.login: (_) => _screenFactory.makeLogin(),
    MainNavigationRouteNames.registration: (_) =>
        _screenFactory.makeRegistration(),

    // ---------- Admin screen route ------------------//

    MainNavigationRouteNames.mainAdminScreen: (_) =>
        _screenFactory.makeAdminScreen(),

    // ---------- Fakultet screen route ------------------//

    MainNavigationRouteNames.fakultetScreen: (_) =>
        _screenFactory.makeFakultetScreen(),

    // ---------- Main teacher screen route ------------------//

    MainNavigationRouteNames.mainTeacherScreen: (_) =>
        _screenFactory.makeMainTeacherScreen(),

    // ---------- Yuklama screen route ------------------//

    MainNavigationRouteNames.yuklamaScreen: (_) =>
        _screenFactory.makeYuklamaScreen(),

    // ---------- Adabiyotlar ro'yxatini ko'rish va yaratish screen route ------------------//

    MainNavigationRouteNames.adabiyotlarRuyxatiKurishScreen: (_) =>
        _screenFactory.makeAdabiyotlarRuyxatiKurishScreen(),
    MainNavigationRouteNames.adabiyotlarRuyxatiYaratishScreen: (_) =>
        _screenFactory.makeAdabiyotlarRuyxatiYaratishScreen(),

    // ---------- Ilmiy ishlar screen route ------------------//

    MainNavigationRouteNames.ilmiyIshlar: (_) =>
        _screenFactory.makeIlmiyIshlarScreen(),

    MainNavigationRouteNames.ilmiyIshlarYaratish: (_) =>
        _screenFactory.makeIlmiyIshlarYaratishScreen(),

    // MainNavigationRouteNames.ilmiyIshlarDetails: (_) =>
    //     _screenFactory.makeIlmiyIshlarDetailsScreen(),

    // ---------- O'quv uslubiy ishlar screen route ------------------//

    MainNavigationRouteNames.oquvUslubiyIshlar: (_) =>
        _screenFactory.makeOquvUslubiyIshlarScreen(),

    MainNavigationRouteNames.oquvUslubiyIshlarYaratish: (_) =>
        _screenFactory.makeOquvUslubiyIshlarYaratish(),
    // MainNavigationRouteNames.shaxsiyMalumotlar: (_) =>
    //     _screenFactory.makeShaxsiyMalumotlarScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case MainNavigationRouteNames.ilmiyIshlarDetails:
      //   final arguments = settings.arguments;
      //   final scienceTitle = arguments is String ? arguments : '';

      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         _screenFactory.makeIlmiyIshlarDetailsScreen(scienceTitle),
      //   );

      // case MainNavigationRouteNames.yuklamaScreen:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) => _screenFactory.makeYuklamaScreen(teacherId),
      //   );

      // case MainNavigationRouteNames.adabiyotlarRuyxatiKurishScreen:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         _screenFactory.makeAdabiyotlarRuyxatiKurishScreen(teacherId),
      //   );

      // case MainNavigationRouteNames.adabiyotlarRuyxatiYaratishScreen:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         _screenFactory.makeAdabiyotlarRuyxatiYaratishScreen(teacherId),
      //   );

      // case MainNavigationRouteNames.ilmiyIshlar:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) => _screenFactory.makeIlmiyIshlarScreen(),
      //   );

      // case MainNavigationRouteNames.oquvUslubiyIshlar:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) => _screenFactory.makeOquvUslubiyIshlarScreen(),
      //   );

      // case MainNavigationRouteNames.shaxsiyMalumotlar:
      //   final arguments = settings.arguments;
      //   final teacherId = arguments is int ? arguments : 0;
      //   // final categoryFile = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) => _screenFactory.makeShaxsiyMalumotlarScreen(teacherId),
      //   );

      case MainNavigationRouteNames.kafedraScreen:
        final arguments = settings.arguments;
        final fakultetId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeKafedraScreen(fakultetId),
        );
      case MainNavigationRouteNames.teacherScreen:
        final arguments = settings.arguments;
        final kafedraId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeTeacherScreen(kafedraId),
        );

      case MainNavigationRouteNames.pdfScreen:
        final arguments = settings.arguments;
        final pdfUrl = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePdfScreen(pdfUrl),
        );

      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
