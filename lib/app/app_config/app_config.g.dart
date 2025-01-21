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
    45820206,
    4292305074,
    1553598735,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    45820234,
    4292305111,
    1553598841,
  ];

  static final String secretKey = String.fromCharCodes(List<int>.generate(
    _envieddatasecretKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]));
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/prod.env
final class _Prod {
  static const List<int> _enviedkeybaseUrl = <int>[
    3619294633,
    560029786,
    3178585068,
    3377720392,
    977735066,
    2142081055,
    1298585806,
    933917938,
    1244996901,
    1950368931,
    2147265964,
    2338251746,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3619294657,
    560029742,
    3178584984,
    3377720376,
    977735145,
    2142081061,
    1298585825,
    933917917,
    1244996949,
    1950368977,
    2147265987,
    2338251654,
  ];

  static final String baseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]));

  static const List<int> _enviedkeysecretKey = <int>[
    2449171331,
    2315988352,
    1037757119,
    3159274193,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2449171443,
    2315988466,
    1037757136,
    3159274165,
  ];

  static final String secretKey = String.fromCharCodes(List<int>.generate(
    _envieddatasecretKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]));
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/stage.env
final class _Stage {
  static const List<int> _enviedkeybaseUrl = <int>[
    443716089,
    3928907238,
    1851881210,
    3858110087,
    3324475128,
    1601592105,
    2404110281,
    1092690431,
    1025677374,
    3283672546,
    425122182,
    3412521909,
    1297182020,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    443715985,
    3928907154,
    1851881102,
    3858110199,
    3324475019,
    1601592083,
    2404110310,
    1092690384,
    1025677389,
    3283672470,
    425122279,
    3412521938,
    1297181985,
  ];

  static final String baseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]));

  static const List<int> _enviedkeysecretKey = <int>[
    58874248,
    3497500657,
    3833421599,
    555777488,
    132619188,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    58874363,
    3497500549,
    3833421694,
    555777463,
    132619217,
  ];

  static final String secretKey = String.fromCharCodes(List<int>.generate(
    _envieddatasecretKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]));
}
