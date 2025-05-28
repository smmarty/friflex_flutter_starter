// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/dev.env
final class _Dev {
  static const String baseUrl = 'https://dev';

  static const List<int> _enviedkeysecretKey = <int>[
    4165345137,
    3493800243,
    502170426,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    4165345045,
    3493800278,
    502170444,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/prod.env
final class _Prod {
  static const List<int> _enviedkeybaseUrl = <int>[
    1959698309,
    1370422491,
    1593239974,
    2980796982,
    3484307801,
    2340951854,
    4002048327,
    2957329110,
    3569108013,
    2324336979,
    691664904,
    2999310215,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1959698413,
    1370422447,
    1593240018,
    2980796998,
    3484307754,
    2340951828,
    4002048360,
    2957329145,
    3569108061,
    2324336929,
    691664999,
    2999310307,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    4268709792,
    3715718791,
    3691995036,
    2677812110,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    4268709840,
    3715718901,
    3691995123,
    2677812202,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/stage.env
final class _Stage {
  static const List<int> _enviedkeybaseUrl = <int>[
    3824074796,
    1785932277,
    700105518,
    2614901365,
    2850858902,
    3082107206,
    3784178565,
    815141967,
    4277092750,
    3942345021,
    1481955512,
    3678805330,
    206487437,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3824074820,
    1785932161,
    700105562,
    2614901253,
    2850858981,
    3082107260,
    3784178602,
    815141984,
    4277092861,
    3942345033,
    1481955545,
    3678805301,
    206487528,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    1473916388,
    2313056220,
    2069119783,
    32407210,
    317937387,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1473916311,
    2313056168,
    2069119814,
    32407245,
    317937294,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
