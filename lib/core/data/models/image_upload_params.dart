class ImageUploadParams {
  ImageUploadParams({
    this.url,
    this.bucket,
    this.key,
  });

  ImageUploadParams.fromJson(dynamic json) {
    url = json['url'];
    bucket = json['bucket'] ?? json['data']['Bucket'];
    key = json['key'] ?? json['data']['key'];
  }

  String? url;
  String? bucket;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['bucket'] = bucket;
    map['key'] = key;
    return map;
  }
}
