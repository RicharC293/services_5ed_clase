// aquí colocamos nuestro modelo

class ServiceResponse {
  final List<Service> data;

  ServiceResponse({required this.data});

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      data: (json['data'] as List).map((e) => Service.fromJson(e)).toList(),
    );
  }
}

class Service {
  final int id;
  final String documentId;
  final String name;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final Media icon;
  final Media banner;

  Service({
    required this.id,
    required this.documentId,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.icon,
    required this.banner,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      publishedAt: DateTime.parse(json['publishedAt']),
      icon: Media.fromJson(json['icon']),
      banner: Media.fromJson(json['banner']),
    );
  }
}

class Media {
  final int id;
  final String documentId;
  final String name;
  final String? url;
  final MediaFormats? formats;

  Media({
    required this.id,
    required this.documentId,
    required this.name,
    this.url,
    this.formats,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      url: json['url'],
      formats: json['formats'] != null
          ? MediaFormats.fromJson(json['formats'])
          : null,
    );
  }
}

class MediaFormats {
  final MediaFormat? small;
  final MediaFormat? medium;
  final MediaFormat? large;
  final MediaFormat? thumbnail;

  MediaFormats({this.small, this.medium, this.large, this.thumbnail});

  factory MediaFormats.fromJson(Map<String, dynamic> json) {
    return MediaFormats(
      small: json['small'] != null ? MediaFormat.fromJson(json['small']) : null,
      medium: json['medium'] != null
          ? MediaFormat.fromJson(json['medium'])
          : null,
      large: json['large'] != null ? MediaFormat.fromJson(json['large']) : null,
      thumbnail: json['thumbnail'] != null
          ? MediaFormat.fromJson(json['thumbnail'])
          : null,
    );
  }
}

class MediaFormat {
  final String ext;
  final String url;

  MediaFormat({required this.ext, required this.url});

  factory MediaFormat.fromJson(Map<String, dynamic> json) {
    return MediaFormat(ext: json['ext'], url: json['url']);
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(pagination: Pagination.fromJson(json['pagination']));
  }
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      pageCount: json['pageCount'],
      total: json['total'],
    );
  }
}
