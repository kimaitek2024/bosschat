import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'tl', 'ja'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? tlText = '',
    String? jaText = '',
  }) =>
      [enText, arText, tlText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Chat_Main
  {
    'q1wx5r9k': {
      'en': 'New Chat',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '9vkm06w9': {
      'en': 'Recents',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'vsdzhdiv': {
      'en': 'Boss Chat',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '9zg2gjnq': {
      'en': 'Hello.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'sab0rwcn': {
      'en': 'How can I help you today?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '50dhe8m3': {
      'en': 'Personality',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'iqyaktdq': {
      'en': 'Create your own personality',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'w5eu16md': {
      'en': 'Help me Learn UX',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'ld4hfu53': {
      'en':
          'Give me a breakdown of product design and the steps I need to take to be successful.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '5n9onkka': {
      'en': 'Create Recipe',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'g80x2l4g': {
      'en': 'Make me a delicious desert that resembles Cheesecake.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'nq0l8550': {
      'en': 'Learn from Master Dee',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'ft96lj2p': {
      'en':
          'What are the best options for learning FlutterFlow and becoming an expert at the platform?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'et5y313b': {
      'en': 'Tell me a joke',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'aeceaaph': {
      'en': 'Tell me a joke about a barista.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'n03iww9k': {
      'en': 'Create Recipe',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'nd4eya9z': {
      'en': 'Make me a delicious desert that resembles Cheesecake.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '72v0yrd9': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // auth_WelcomeScreen
  {
    'nyd8obzz': {
      'en': 'Welcome to Boss Chat',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'eva1v1yn': {
      'en': 'Start to navigate the world of excitement and future trends!',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'v9yhg1di': {
      'en': 'Awesome Recipes',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'dxplh4y4': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'tb7p1k2w': {
      'en': 'Personalized recipe discovery',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'hj6ivrd1': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'zax74u8w': {
      'en': 'Login',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'hpchxatm': {
      'en': 'Create an Account',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'fa6rzyp2': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // auth_Create
  {
    'mteqgudr': {
      'en': 'Welcome to our application!',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'oitqjkz1': {
      'en': 'Save delicious recipes and get personalized content.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'ut0mc379': {
      'en': 'Display Name',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '0tamvrrg': {
      'en': 'Email Address',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'zfkn0gns': {
      'en': 'Password',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '1fy9whma': {
      'en': 'Create Account',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '490ywm2o': {
      'en': 'Skip',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'qxow3vky': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // auth_Login
  {
    'njbgwvsf': {
      'en': 'Get to my account',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '1h3mowgr': {
      'en': 'Access your wonderful things by logging in below.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'nsctkjln': {
      'en': 'Email Address',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'dhf3t1j0': {
      'en': 'Password',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'lyslioem': {
      'en': 'Forgot Password?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'n8swczo6': {
      'en': 'Login',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'xuagex7l': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // auth_ForgotPassword
  {
    'rmanw9ap': {
      'en': 'Forgot Password',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '3yjlaky5': {
      'en': 'We will send you a reset link.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'zi77po96': {
      'en': 'Email Address',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'h76n3pxf': {
      'en': 'Send Link',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'e5gbt0kr': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // Personality
  {
    '5uyo01k3': {
      'en': 'New Chat',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '5r4bi90v': {
      'en': 'Recents',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'b0101kcs': {
      'en': 'Boss Aicon',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'qjarzq0r': {
      'en': 'Personalities',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '3qqp6ncd': {
      'en': 'Create your own today?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'stw60921': {
      'en': 'Create Recipe',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'x09najr2': {
      'en': 'Make me a delicious desert that resembles Cheesecake.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '1wgdibk9': {
      'en': 'Learn from Master Dee',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'v3oguuy7': {
      'en':
          'What are the best options for learning FlutterFlow and becoming an expert at the platform?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'qesn884o': {
      'en': 'Tell me a joke',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'scgccnc8': {
      'en': 'Tell me a joke about a barista.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'qywz88wn': {
      'en': 'Create Recipe',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'r7vmrk94': {
      'en': 'Make me a delicious desert that resembles Cheesecake.',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '062g2i2r': {
      'en': 'Home',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // chatThread
  {
    'o08m2dka': {
      'en': 'Gemini Ai',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'biea710v': {
      'en': 'Enter prompt here...',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'z84c4s6n': {
      'en': 'Send',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // emptyList
  {
    '5tvc5tst': {
      'en': 'Create your own personality',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'yh4kryjw': {
      'en': 'Help Center?',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // thread_Chats
  {
    'gtelunyr': {
      'en': 'Boss Chat',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '78ke36cf': {
      'en': 'Enter prompt here...',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'o2qserc7': {
      'en': 'Send',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // dropdown_EditConversation
  {
    'cfteftcw': {
      'en': 'Options',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'f0npet15': {
      'en': 'Rename',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'lo5ctg9c': {
      'en': 'New name here...',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'xsi9lvzb': {
      'en': 'Delete',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'quk16s6c': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'mz4c26ss': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'x45pzovk': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'mdcg79dd': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'k1tghzar': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'xzfigtp6': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'kzr6yi1a': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'cwb8nzbf': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'eqlzkgku': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'q7trl3m4': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '4zscp20t': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '8m5c8de8': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'ynj5kgsd': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '1hd3uqwo': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'ik17dc5q': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'wfwfmzo0': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'nino4l86': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    't7nr0n57': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'wydmh5m3': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '57v6v65q': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'r29nc8w6': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'rgqfmdah': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    't53lemhq': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    'b46ovclr': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
    '09tmw8ez': {
      'en': '',
      'ar': '',
      'ja': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
