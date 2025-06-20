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
    1144186709,
    921404830,
    4081271781,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1144186673,
    921404923,
    4081271699,
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
    3830062036,
    1024953349,
    2723997296,
    2959773775,
    4255295633,
    114701674,
    1920572043,
    3423730200,
    3647804248,
    2815792265,
    3038381766,
    655048609,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3830062012,
    1024953457,
    2723997188,
    2959773759,
    4255295714,
    114701648,
    1920572068,
    3423730231,
    3647804200,
    2815792379,
    3038381737,
    655048645,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    359753139,
    3208048313,
    1722903860,
    3044498179,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    359753155,
    3208048331,
    1722903899,
    3044498279,
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
    2791397647,
    1739207173,
    306419752,
    1371918084,
    4062400488,
    3004897854,
    2820011348,
    1751321626,
    3103957517,
    2168627914,
    1003673382,
    1168070657,
    568662299,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    2791397735,
    1739207281,
    306419804,
    1371918196,
    4062400411,
    3004897796,
    2820011387,
    1751321653,
    3103957630,
    2168627902,
    1003673415,
    1168070758,
    568662398,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    2132342089,
    2579069434,
    3904165526,
    3391356107,
    1192880530,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2132342074,
    2579069326,
    3904165623,
    3391356076,
    1192880631,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
