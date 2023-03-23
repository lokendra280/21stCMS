class TaskModel {
  List<Data>? data;
  Meta? meta;

  TaskModel({this.data, this.meta});

  TaskModel.fromJson(Map<String, dynamic> json) {
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
  String? heading;
  String? description;
  Null? startDate;
  String? dueDate;
  String? priority;
  String? status;
  int? isPrivate;
  User? user;
  Project? project;
  Null? category;
  User? createBy;

  Data(
      {this.id,
      this.heading,
      this.description,
      this.startDate,
      this.dueDate,
      this.priority,
      this.status,
      this.isPrivate,
      this.user,
      this.project,
      this.category,
      this.createBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['description'];
    startDate = json['start_date'];
    dueDate = json['due_date'];
    priority = json['priority'];
    status = json['status'];
    isPrivate = json['is_private'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    category = json['category'];
    createBy =
        json['create_by'] != null ? new User.fromJson(json['create_by']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['due_date'] = this.dueDate;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['is_private'] = this.isPrivate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['category'] = this.category;
    if (this.createBy != null) {
      data['create_by'] = this.createBy!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
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

class Project {
  int? id;
  String? projectName;

  Project({this.id, this.projectName});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    return data;
  }
}

class Meta {
  Paging? paging;
  double? time;
  int? queries;
  List<QueriesList>? queriesList;

  Meta({this.paging, this.time, this.queries, this.queriesList});

  Meta.fromJson(Map<String, dynamic> json) {
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    time = json['time'];
    queries = json['queries'];
    if (json['queries_list'] != null) {
      queriesList = <QueriesList>[];
      json['queries_list'].forEach((v) {
        queriesList!.add(new QueriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    data['time'] = this.time;
    data['queries'] = this.queries;
    if (this.queriesList != null) {
      data['queries_list'] = this.queriesList!.map((v) => v.toJson()).toList();
    }
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

class QueriesList {
  String? query;
  List<int>? bindings;
  double? time;

  QueriesList({this.query, this.bindings, this.time});

  QueriesList.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    bindings = json['bindings'].cast<int>();
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['bindings'] = this.bindings;
    data['time'] = this.time;
    return data;
  }
}
