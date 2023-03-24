class EventModel {
  List<Data>? data;
  Meta? meta;

  EventModel({this.data, this.meta});

  EventModel.fromJson(Map<String, dynamic> json) {
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
  String? eventName;
  String? where;
  String? description;
  String? startDateTime;
  String? endDateTime;
  String? labelColor;
  String? repeat;
  Null? repeatEvery;
  Null? repeatCycles;
  String? repeatType;
  String? sendReminder;
  Null? remindTime;
  String? remindType;

  Data(
      {this.id,
      this.eventName,
      this.where,
      this.description,
      this.startDateTime,
      this.endDateTime,
      this.labelColor,
      this.repeat,
      this.repeatEvery,
      this.repeatCycles,
      this.repeatType,
      this.sendReminder,
      this.remindTime,
      this.remindType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    where = json['where'];
    description = json['description'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    labelColor = json['label_color'];
    repeat = json['repeat'];
    repeatEvery = json['repeat_every'];
    repeatCycles = json['repeat_cycles'];
    repeatType = json['repeat_type'];
    sendReminder = json['send_reminder'];
    remindTime = json['remind_time'];
    remindType = json['remind_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_name'] = this.eventName;
    data['where'] = this.where;
    data['description'] = this.description;
    data['start_date_time'] = this.startDateTime;
    data['end_date_time'] = this.endDateTime;
    data['label_color'] = this.labelColor;
    data['repeat'] = this.repeat;
    data['repeat_every'] = this.repeatEvery;
    data['repeat_cycles'] = this.repeatCycles;
    data['repeat_type'] = this.repeatType;
    data['send_reminder'] = this.sendReminder;
    data['remind_time'] = this.remindTime;
    data['remind_type'] = this.remindType;
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
