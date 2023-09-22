class KeitaroCampaign {
  KeitaroCampaign({
    required this.id,
    required this.alias,
    required this.name,
    required this.type,
    required this.uniquenessMethod,
    required this.uniquenessUseCookies,
    required this.cookiesTtl,
    required this.position,
    required this.state,
    required this.updatedAt,
    required this.costType,
    required this.costValue,
    required this.costCurrency,
    required this.groupId,
    required this.bindVisitors,
    required this.postbacks,
    required this.token,
    required this.notes,
    required this.trafficSourceId,
    required this.costAuto,
    required this.domainId,
    required this.parameters,
    required this.trafficLoss,
    required this.domain,
    required this.group,
    required this.streamsCount,
    required this.ts,
  });
  late final int id;
  late final String alias;
  late final String name;
  late final String type;
  late final String uniquenessMethod;
  late final bool uniquenessUseCookies;
  late final int cookiesTtl;
  late final int position;
  late final String state;
  late final String updatedAt;
  late final String costType;
  late final String costValue;
  late final String costCurrency;
  late final int groupId;
  late final String bindVisitors;
  late final List<dynamic> postbacks;
  late final String token;
  late final String notes;
  late final int trafficSourceId;
  late final bool costAuto;
  late final int domainId;
  late final Parameters parameters;
  late final String trafficLoss;
  late final String domain;
  late final String group;
  late final String streamsCount;
  late final String ts;

  KeitaroCampaign.fromJson(Map<String, dynamic> json){
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    type = json['type'];
    uniquenessMethod = json['uniqueness_method'];
    uniquenessUseCookies = json['uniqueness_use_cookies'];
    cookiesTtl = json['cookies_ttl'];
    position = json['position'];
    state = json['state'];
    updatedAt = json['updated_at'];
    costType = json['cost_type'];
    costValue = json['cost_value'];
    costCurrency = json['cost_currency'];
    groupId = json['group_id'];
    bindVisitors = json['bind_visitors'];
    postbacks = List.castFrom<dynamic, dynamic>(json['postbacks']);
    token = json['token'];
    notes = json['notes'];
    trafficSourceId = json['traffic_source_id'];
    costAuto = json['cost_auto'];
    domainId = json['domain_id'];
    parameters = Parameters.fromJson(json['parameters']);
    trafficLoss = json['traffic_loss'];
    domain = json['domain'];
    group = json['group'];
    streamsCount = json['streams_count'];
    ts = json['ts'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['alias'] = alias;
    _data['name'] = name;
    _data['type'] = type;
    _data['uniqueness_method'] = uniquenessMethod;
    _data['uniqueness_use_cookies'] = uniquenessUseCookies;
    _data['cookies_ttl'] = cookiesTtl;
    _data['position'] = position;
    _data['state'] = state;
    _data['updated_at'] = updatedAt;
    _data['cost_type'] = costType;
    _data['cost_value'] = costValue;
    _data['cost_currency'] = costCurrency;
    _data['group_id'] = groupId;
    _data['bind_visitors'] = bindVisitors;
    _data['postbacks'] = postbacks;
    _data['token'] = token;
    _data['notes'] = notes;
    _data['traffic_source_id'] = trafficSourceId;
    _data['cost_auto'] = costAuto;
    _data['domain_id'] = domainId;
    _data['parameters'] = parameters.toJson();
    _data['traffic_loss'] = trafficLoss;
    _data['domain'] = domain;
    _data['group'] = group;
    _data['streams_count'] = streamsCount;
    _data['ts'] = ts;
    return _data;
  }
}

class Parameters {
  Parameters({
    required this.keyword,
    required this.cost,
    required this.currency,
    required this.externalId,
    required this.creativeId,
    required this.adCampaignId,
    required this.source,
    required this.subId_1,
    required this.subId_2,
    required this.subId_3,
    required this.subId_4,
    required this.subId_5,
    required this.subId_6,
    required this.subId_7,
    required this.subId_8,
    required this.subId_9,
  });
  late final Keyword keyword;
  late final Cost cost;
  late final Currency currency;
  late final ExternalId externalId;
  late final CreativeId creativeId;
  late final AdCampaignId adCampaignId;
  late final Source source;
  late final SubId_1 subId_1;
  late final SubId_2 subId_2;
  late final SubId_3 subId_3;
  late final SubId_4 subId_4;
  late final SubId_5 subId_5;
  late final SubId_6 subId_6;
  late final SubId_7 subId_7;
  late final SubId_8 subId_8;
  late final SubId_9 subId_9;

  Parameters.fromJson(Map<String, dynamic> json){
    keyword = Keyword.fromJson(json['keyword']);
    cost = Cost.fromJson(json['cost']);
    currency = Currency.fromJson(json['currency']);
    externalId = ExternalId.fromJson(json['external_id']);
    creativeId = CreativeId.fromJson(json['creative_id']);
    adCampaignId = AdCampaignId.fromJson(json['ad_campaign_id']);
    source = Source.fromJson(json['source']);
    subId_1 = SubId_1.fromJson(json['sub_id_1']);
    subId_2 = SubId_2.fromJson(json['sub_id_2']);
    subId_3 = SubId_3.fromJson(json['sub_id_3']);
    subId_4 = SubId_4.fromJson(json['sub_id_4']);
    subId_5 = SubId_5.fromJson(json['sub_id_5']);
    subId_6 = SubId_6.fromJson(json['sub_id_6']);
    subId_7 = SubId_7.fromJson(json['sub_id_7']);
    subId_8 = SubId_8.fromJson(json['sub_id_8']);
    subId_9 = SubId_9.fromJson(json['sub_id_9']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['keyword'] = keyword.toJson();
    _data['cost'] = cost.toJson();
    _data['currency'] = currency.toJson();
    _data['external_id'] = externalId.toJson();
    _data['creative_id'] = creativeId.toJson();
    _data['ad_campaign_id'] = adCampaignId.toJson();
    _data['source'] = source.toJson();
    _data['sub_id_1'] = subId_1.toJson();
    _data['sub_id_2'] = subId_2.toJson();
    _data['sub_id_3'] = subId_3.toJson();
    _data['sub_id_4'] = subId_4.toJson();
    _data['sub_id_5'] = subId_5.toJson();
    _data['sub_id_6'] = subId_6.toJson();
    _data['sub_id_7'] = subId_7.toJson();
    _data['sub_id_8'] = subId_8.toJson();
    _data['sub_id_9'] = subId_9.toJson();
    return _data;
  }
}

class Keyword {
  Keyword({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  Keyword.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class Cost {
  Cost({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  Cost.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class Currency {
  Currency({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  Currency.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class ExternalId {
  ExternalId({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  ExternalId.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class CreativeId {
  CreativeId({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  CreativeId.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class AdCampaignId {
  AdCampaignId({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  AdCampaignId.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class Source {
  Source({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  Source.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_1 {
  SubId_1({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_1.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_2 {
  SubId_2({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_2.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_3 {
  SubId_3({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_3.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_4 {
  SubId_4({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_4.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_5 {
  SubId_5({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_5.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_6 {
  SubId_6({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_6.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_7 {
  SubId_7({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_7.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_8 {
  SubId_8({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_8.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}

class SubId_9 {
  SubId_9({
    required this.name,
    required this.placeholder,
    required this.alias,
  });
  late final String name;
  late final String placeholder;
  late final String alias;

  SubId_9.fromJson(Map<String, dynamic> json){
    name = json['name'];
    placeholder = json['placeholder'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeholder'] = placeholder;
    _data['alias'] = alias;
    return _data;
  }
}
