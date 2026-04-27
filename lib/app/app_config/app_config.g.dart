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
    1250675737,
    1700106436,
    3701613773,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1250675837,
    1700106401,
    3701613755,
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
    2313418965,
    1278864221,
    2117667009,
    1514310825,
    996679495,
    1388625655,
    2368060187,
    1047428716,
    502950869,
    2499923893,
    963407594,
    1679400929,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    2313418941,
    1278864169,
    2117666997,
    1514310873,
    996679476,
    1388625613,
    2368060212,
    1047428675,
    502950821,
    2499923911,
    963407493,
    1679400837,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    1650398676,
    1481444979,
    21401329,
    1103991377,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1650398628,
    1481444865,
    21401246,
    1103991349,
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
    1623636460,
    1720327728,
    1318998227,
    1880230818,
    1752001284,
    726589281,
    1688681936,
    2751223200,
    1403987498,
    1289212622,
    1492662645,
    2947900480,
    809806156,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1623636356,
    1720327748,
    1318998183,
    1880230866,
    1752001399,
    726589275,
    1688681983,
    2751223183,
    1403987545,
    1289212602,
    1492662548,
    2947900455,
    809806121,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    5890476,
    3047051242,
    2874959210,
    758075519,
    3738110555,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    5890527,
    3047051166,
    2874959115,
    758075416,
    3738110526,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
