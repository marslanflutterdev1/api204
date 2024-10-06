class CoinDeskApiModel {
  CoinDeskApiModel({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory CoinDeskApiModel.fromJson(Map<String, dynamic> json) {
    return CoinDeskApiModel(
      time: json['time'] != null ? Time.fromJson(json['time']) : throw Exception('Missing time data'),
      disclaimer: json['disclaimer'] ?? '',
      chartName: json['chartName'] ?? '',
      bpi: json['bpi'] != null ? Bpi.fromJson(json['bpi']) : throw Exception('Missing BPI data'),
    );
  }

  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  Map<String, dynamic> toJson() {
    return {
      'time': time.toJson(),
      'disclaimer': disclaimer,
      'chartName': chartName,
      'bpi': bpi.toJson(),
    };
  }
}

class Bpi {
  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) {
    return Bpi(
      usd: json['USD'] != null ? Usd.fromJson(json['USD']) : throw Exception('Missing USD data'),
      gbp: json['GBP'] != null ? Gbp.fromJson(json['GBP']) : throw Exception('Missing GBP data'),
      eur: json['EUR'] != null ? Eur.fromJson(json['EUR']) : throw Exception('Missing EUR data'),
    );
  }

  final Usd usd;
  final Gbp gbp;
  final Eur eur;

  Map<String, dynamic> toJson() {
    return {
      'USD': usd.toJson(),
      'GBP': gbp.toJson(),
      'EUR': eur.toJson(),
    };
  }
}

class Usd {
  Usd({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Usd.fromJson(Map<String, dynamic> json) {
    return Usd(
      code: json['code'] ?? '',
      symbol: json['symbol'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      rateFloat: json['rate_float']?.toDouble() ?? 0.0,
    );
  }

  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'symbol': symbol,
      'rate': rate,
      'description': description,
      'rate_float': rateFloat,
    };
  }
}

class Gbp {
  Gbp({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Gbp.fromJson(Map<String, dynamic> json) {
    return Gbp(
      code: json['code'] ?? '',
      symbol: json['symbol'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      rateFloat: json['rate_float']?.toDouble() ?? 0.0,
    );
  }

  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'symbol': symbol,
      'rate': rate,
      'description': description,
      'rate_float': rateFloat,
    };
  }
}

class Eur {
  Eur({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Eur.fromJson(Map<String, dynamic> json) {
    return Eur(
      code: json['code'] ?? '',
      symbol: json['symbol'] ?? '',
      rate: json['rate'] ?? '',
      description: json['description'] ?? '',
      rateFloat: json['rate_float']?.toDouble() ?? 0.0,
    );
  }

  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'symbol': symbol,
      'rate': rate,
      'description': description,
      'rate_float': rateFloat,
    };
  }
}

class Time {
  Time({
    required this.updated,
    required this.updatedISO,
    required this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      updated: json['updated'] ?? '',
      updatedISO: json['updatedISO'] ?? '',
      updateduk: json['updateduk'] ?? '',
    );
  }

  final String updated;
  final String updatedISO;
  final String updateduk;

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'updatedISO': updatedISO,
      'updateduk': updateduk,
    };
  }
}
