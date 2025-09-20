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
    1799992456,
    3121235721,
    1896517115,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1799992556,
    3121235820,
    1896517005,
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
    1627073061,
    1329144317,
    4010373711,
    41847181,
    869222509,
    509998400,
    1912743375,
    3591333682,
    1441008454,
    2168353742,
    3600711694,
    2824342757,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1627073101,
    1329144201,
    4010373691,
    41847293,
    869222430,
    509998458,
    1912743392,
    3591333661,
    1441008438,
    2168353724,
    3600711777,
    2824342657,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    491371727,
    838972038,
    2580624111,
    1889389419,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    491371711,
    838972148,
    2580624000,
    1889389327,
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
    585835488,
    3326410961,
    3188945183,
    460492541,
    1928378853,
    1675035574,
    2754976633,
    2459126129,
    3745790828,
    3098981050,
    99445498,
    3535573105,
    3875375463,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    585835400,
    3326410917,
    3188945259,
    460492429,
    1928378774,
    1675035532,
    2754976598,
    2459126110,
    3745790751,
    3098981070,
    99445403,
    3535573014,
    3875375362,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    986583346,
    12639897,
    2122410836,
    1036379862,
    1792372112,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    986583361,
    12639981,
    2122410805,
    1036379825,
    1792372213,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
