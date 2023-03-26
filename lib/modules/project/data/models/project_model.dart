class ProjectModel {
  List<Data>? data;
  Meta? meta;

  ProjectModel({this.data, this.meta});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? ProjectModelName;
  String? ProjectModelSummary;
  String? notes;
  String? startDate;
  String? deadline;
  String? status;
  Category? category;
  Client? client;

  Data(
      {this.id,
      this.ProjectModelName,
      this.ProjectModelSummary,
      this.notes,
      this.startDate,
      this.deadline,
      this.status,
      this.category,
      this.client});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ProjectModelName = json['ProjectModel_name'];
    ProjectModelSummary = json['ProjectModel_summary'];
    notes = json['notes'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    status = json['status'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ProjectModel_name'] = this.ProjectModelName;
    data['ProjectModel_summary'] = this.ProjectModelSummary;
    data['notes'] = this.notes;
    data['start_date'] = this.startDate;
    data['deadline'] = this.deadline;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}

class Client {
  int? id;
  String? name;

  Client({this.id, this.name});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Meta {
  Paging? paging;
  double? time;

  Meta({this.paging, this.time});

  Meta.fromJson(Map<String, dynamic> json) {
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Paging {
  Links? links;
  int? total;

  Paging({this.links, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['total'] = this.total;
    return data;
  }
}

class Links {
  String? next;

  Links({this.next});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    return data;
  }
}
