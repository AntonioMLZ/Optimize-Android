import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['es', 'en'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String esText = '',
    String enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'anzqtwha': {
      'es': 'Register',
      'en': 'Register',
    },
    '87jspd9v': {
      'es': 'Login',
      'en': 'Login',
    },
    'rty74288': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Register
  {
    'ngcxqpgn': {
      'es': 'Full Name',
      'en': 'Full Name',
    },
    'zucr7f5l': {
      'es': 'Enter your name here...',
      'en': 'Enter your name here...',
    },
    'of0vt3em': {
      'es': 'Email Address',
      'en': 'email address',
    },
    'v3mlpimx': {
      'es': 'Enter your email here...',
      'en': 'Enter your email here...',
    },
    'o2i3rlks': {
      'es': 'Password',
      'en': 'Password',
    },
    'y058x2fx': {
      'es': 'Enter your password here...',
      'en': 'Enter your password here...',
    },
    'g92dekqo': {
      'es': 'Confirm Password',
      'en': 'Confirm Password',
    },
    'q9xcxcq6': {
      'es': 'Confirm password here...',
      'en': 'Confirm password here...',
    },
    '42qxyku2': {
      'es': 'Create Account',
      'en': 'Create Account',
    },
    'lsvdox2m': {
      'es': 'Don’t have an account yet? ',
      'en': 'Don&#39;t have an account yet?',
    },
    'vewopc9y': {
      'es': 'Login',
      'en': 'Login',
    },
    'm18n788r': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Login
  {
    'we28g2am': {
      'es': 'Email Address',
      'en': 'email address',
    },
    'x1bwp0hl': {
      'es': 'Your email...',
      'en': 'Your email...',
    },
    'fs48slfl': {
      'es': 'Password',
      'en': 'Password',
    },
    'me7ryugz': {
      'es': 'Enter your password here...',
      'en': 'Enter your password here...',
    },
    'c3hb8t27': {
      'es': 'Login',
      'en': 'Login',
    },
    'iszm3vqb': {
      'es': 'Don’t have an account yet? ',
      'en': 'Don&#39;t have an account yet?',
    },
    'ln06xegs': {
      'es': 'Register',
      'en': 'Register',
    },
    'e23h383h': {
      'es': 'Please fill in a valid email address...',
      'en': 'Please fill in a valid email address...',
    },
    'r8dt13y6': {
      'es': 'That password doesn\'t match.',
      'en': 'That password doesn&#39;t match.',
    },
    '6xbeu1as': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Home
  {
    '2rn9piuc': {
      'es': 'Musica Online',
      'en': '',
    },
    '8js6pl65': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Apps
  {
    'iq8fea4r': {
      'es': 'Apps',
      'en': 'apps',
    },
  },
  // Settings
  {
    '6he4nf01': {
      'es': 'En Proceso...',
      'en': '',
    },
    'ryxhz0n7': {
      'es': 'Ajustes',
      'en': 'Settings',
    },
    'y43xqq76': {
      'es': 'Settings',
      'en': 'Settings',
    },
  },
  // MyProfile
  {
    'rc6pj6vt': {
      'es': 'Informacion de Cuenta',
      'en': 'Account info',
    },
    'wkedutns': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    '3mq9qrgw': {
      'es': 'Cambiar Password',
      'en': 'Change Password',
    },
    'oxkxgscp': {
      'es': 'Desconectar',
      'en': 'Disconnect',
    },
    'lfe2fbdl': {
      'es': 'Optimize Android v1.6.0',
      'en': 'Optimize Android v1.0.0',
    },
    'ekw7dqpc': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ChangePassword
  {
    '7i1w12p8': {
      'es':
          'Ingrese su correo electrónico y le enviaremos un enlace de restablecimiento de contraseña a su correo electrónico para que lo actualice.',
      'en':
          'Enter your email and we&#39;ll send a password reset link to your email for you to update.',
    },
    'h0uz3c4w': {
      'es': 'Email address here...',
      'en': 'Email address here...',
    },
    'yzzk2wx7': {
      'es': 'We will send a link to your email...',
      'en': 'We will send a link to your email...',
    },
    'qkmzqq2x': {
      'es': 'Send Link',
      'en': 'Send Link',
    },
    'uku2cgp5': {
      'es': 'Please fill in a new password..',
      'en': 'Please fill in a new password..',
    },
    'lmmlxi3w': {
      'es': 'Change Password',
      'en': 'Change Password',
    },
    'tzkdow09': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // EditProfile
  {
    '5x88cg5k': {
      'es': 'Update Account Information',
      'en': 'Update Account Information',
    },
    'kvkv38wh': {
      'es': 'Full Name',
      'en': 'Full Name',
    },
    '17t3cgql': {
      'es': 'Your email...',
      'en': 'Your email...',
    },
    'e695zux8': {
      'es': 'Email Address',
      'en': 'email address',
    },
    'npphndqe': {
      'es': 'Your email...',
      'en': 'Your email...',
    },
    '9rdaj1gt': {
      'es': 'Save Changes',
      'en': 'Save Changes',
    },
    't43bik93': {
      'es': 'Please fill in a valid email address...',
      'en': 'Please fill in a valid email address...',
    },
    'lfrznop2': {
      'es': 'Please fill in a valid email address...',
      'en': 'Please fill in a valid email address...',
    },
    '840070gw': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    'cpvo0xvi': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // downloadapp
  {
    '9yw83l33': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // SettingsApp
  {
    '8ht0kwf0': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    'iv8cqhro': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // View
  {
    'cokyzs2t': {
      'es': 'AntonioMLZ',
      'en': 'AntonioMLZ',
    },
    '36v1cft4': {
      'es': 'Descripcion Larga',
      'en': 'Long description',
    },
  },
  // Admin
  {
    'cce7tk81': {
      'es': 'Create Post',
      'en': 'Create Post',
    },
    's18kkfng': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    'dj8ov5l1': {
      'es': 'Enter post details here...',
      'en': 'Enter post details here...',
    },
    'j66bwxnt': {
      'es': 'Descripcion Corta',
      'en': 'Short description',
    },
    'yuq3u37x': {
      'es': 'Enter post details here...',
      'en': 'Enter post details here...',
    },
    'bzazg4l2': {
      'es': 'Create Post',
      'en': 'Create Post',
    },
  },
  // Load
  {
    '5ehnfgqj': {
      'es': 'Descargar',
      'en': 'Download',
    },
  },
  // vIEWS
  {
    'jwbhnx3z': {
      'es': 'Page Title',
      'en': '',
    },
    'qtnebx4c': {
      'es': 'Home',
      'en': '',
    },
  },
  // adds
  {
    '808gfr70': {
      'es': 'Home',
      'en': '',
    },
  },
  // MusicPlayer
  {
    '32p9ub63': {
      'es': 'REPRODUCTO DE MUSICA',
      'en': '',
    },
    'mmoa2tou': {
      'es': 'Home',
      'en': '',
    },
  },
  // download
  {
    '1q7ijg8j': {
      'es': 'Recordatorio',
      'en': 'Reminder',
    },
    'sw0w9ipu': {
      'es': 'Si no te deja decsrgar nada, haz click en el link url del sitio!',
      'en':
          'If it doesn&#39;t let you download anything, click on the url link of the site!',
    },
    'n0t4c8o3': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'ie8wsbnt': {
      'es': 'Aceptar',
      'en': 'To accept',
    },
  },
  // buttonAjustes
  {
    'xb054ffe': {
      'es': 'Ajustes de Cuenta',
      'en': 'Account Settings',
    },
    'qdek6neg': {
      'es': 'Cambiar correo, resetear contraña, cambiar nombre..',
      'en': 'Change email, reset password, change name..',
    },
    '4ybzr51d': {
      'es': 'Ajustes de Aplicacion',
      'en': 'Application Settings',
    },
    '7f54a7ko': {
      'es': 'Cambiar idioma, Personalizar..',
      'en': 'Change language, Customize..',
    },
  },
  // Miscellaneous
  {
    'vxjx23jv': {
      'es': '',
      'en': '',
    },
    'cmmf6840': {
      'es': '',
      'en': '',
    },
    'o7w0molz': {
      'es': '',
      'en': '',
    },
    '7ns2bd74': {
      'es': '',
      'en': '',
    },
    'lnel42nx': {
      'es': '',
      'en': '',
    },
    '65svjzoa': {
      'es': '',
      'en': '',
    },
    'uc020bsu': {
      'es': '',
      'en': '',
    },
    'ptjbtpry': {
      'es': '',
      'en': '',
    },
    'jzhugadz': {
      'es': '',
      'en': '',
    },
    '4lm4y74v': {
      'es': '',
      'en': '',
    },
    '1rk5xmma': {
      'es': '',
      'en': '',
    },
    's4pnbwb2': {
      'es': '',
      'en': '',
    },
    's2ym8vgb': {
      'es': '',
      'en': '',
    },
    '2torx2oh': {
      'es': '',
      'en': '',
    },
    'u1if8mo0': {
      'es': '',
      'en': '',
    },
    'ugaesr98': {
      'es': '',
      'en': '',
    },
    'mkg3w1oa': {
      'es': '',
      'en': '',
    },
    'wx4st00x': {
      'es': '',
      'en': '',
    },
    'xtv2kt43': {
      'es': '',
      'en': '',
    },
    'qna9uwg0': {
      'es': '',
      'en': '',
    },
    'ycivbky8': {
      'es': '',
      'en': '',
    },
    '7re7k5u2': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
