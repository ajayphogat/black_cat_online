import 'home_model.dart';

class AllProductModel {
  List<AllProduct>? items;
  SearchCriteria? searchCriteria;
  String? totalCount;

  AllProductModel({this.items, this.searchCriteria, this.totalCount});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <AllProduct>[];
      json['items'].forEach((v) {
        items!.add(new AllProduct.fromJson(v));
      });
    }
    searchCriteria = json['search_criteria'] != null
        ? new SearchCriteria.fromJson(json['search_criteria'])
        : null;
    totalCount = json['total_count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.searchCriteria != null) {
      data['search_criteria'] = this.searchCriteria!.toJson();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class AllProduct {
  int? id;
  String? sku;
  String? name;
  int? attributeSetId;
  String? price;
  int? status;
  int? visibility;
  String? typeId;
  String? createdAt;
  String? updatedAt;
  String? weight;
  ExtensionAttributes? extensionAttributes;
  // List<Null>? productLinks;
  // List<Null>? options;
  List<MediaGalleryEntries>? mediaGalleryEntries;
  // List<Null>? tierPrices;
  List<CustomAttributes>? customAttributes;

  AllProduct({
        this.id,
        this.sku,
        this.name,
        this.attributeSetId,
        this.price,
        this.status,
        this.visibility,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.weight,
        this.extensionAttributes,
        // this.productLinks,
        // this.options,
        this.mediaGalleryEntries,
        // this.tierPrices,
        this.customAttributes});

  AllProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    attributeSetId = json['attribute_set_id'];
    price = json['price'].toString();
    status = json['status'];
    visibility = json['visibility'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    weight = json['weight'].toString();
    extensionAttributes = json['extension_attributes'] != null
        ? new ExtensionAttributes.fromJson(json['extension_attributes'])
        : null;
    // if (json['product_links'] != null) {
    //   productLinks = <Null>[];
    //   json['product_links'].forEach((v) {
    //     productLinks!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['options'] != null) {
    //   options = <Null>[];
    //   json['options'].forEach((v) {
    //     options!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['media_gallery_entries'] != null) {
      mediaGalleryEntries = <MediaGalleryEntries>[];
      json['media_gallery_entries'].forEach((v) {
        mediaGalleryEntries!.add(new MediaGalleryEntries.fromJson(v));
      });
    }
    // if (json['tier_prices'] != null) {
    //   tierPrices = <Null>[];
    //   json['tier_prices'].forEach((v) {
    //     tierPrices!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['custom_attributes'] != null) {
      customAttributes = <CustomAttributes>[];
      json['custom_attributes'].forEach((v) {
        customAttributes!.add(new CustomAttributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['attribute_set_id'] = this.attributeSetId;
    data['price'] = this.price;
    data['status'] = this.status;
    data['visibility'] = this.visibility;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['weight'] = this.weight;
    if (this.extensionAttributes != null) {
      data['extension_attributes'] = this.extensionAttributes!.toJson();
    }
    // if (this.productLinks != null) {
    //   data['product_links'] =
    //       this.productLinks!.map((v) => v.toJson()).toList();
    // }
    // if (this.options != null) {
    //   data['options'] = this.options!.map((v) => v.toJson()).toList();
    // }
    if (this.mediaGalleryEntries != null) {
      data['media_gallery_entries'] =
          this.mediaGalleryEntries!.map((v) => v.toJson()).toList();
    }
    // if (this.tierPrices != null) {
    //   data['tier_prices'] = this.tierPrices!.map((v) => v.toJson()).toList();
    // }
    if (this.customAttributes != null) {
      data['custom_attributes'] =
          this.customAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExtensionAttributes {
  List<int>? websiteIds;
  List<CategoryLinks>? categoryLinks;
  List<ConfigurableProductOptions>? configurableProductOptions;
  // List<int>? configurableProductLinks;

  ExtensionAttributes(
      {this.websiteIds,
        this.categoryLinks,
        this.configurableProductOptions,
        /*this.configurableProductLinks*/});

  ExtensionAttributes.fromJson(Map<String, dynamic> json) {
    websiteIds = json['website_ids'].cast<int>();
    if (json['category_links'] != null) {
      categoryLinks = <CategoryLinks>[];
      json['category_links'].forEach((v) {
        categoryLinks!.add(new CategoryLinks.fromJson(v));
      });
    }
    if (json['configurable_product_options'] != null) {
      configurableProductOptions = <ConfigurableProductOptions>[];
      json['configurable_product_options'].forEach((v) {
        configurableProductOptions!
            .add(new ConfigurableProductOptions.fromJson(v));
      });
    }
    // configurableProductLinks = json['configurable_product_links'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['website_ids'] = this.websiteIds;
    if (this.categoryLinks != null) {
      data['category_links'] =
          this.categoryLinks!.map((v) => v.toJson()).toList();
    }
    if (this.configurableProductOptions != null) {
      data['configurable_product_options'] =
          this.configurableProductOptions!.map((v) => v.toJson()).toList();
    }
    // data['configurable_product_links'] = this.configurableProductLinks;
    return data;
  }
}

class CategoryLinks {
  int? position;
  String? categoryId;

  CategoryLinks({this.position, this.categoryId});

  CategoryLinks.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class ConfigurableProductOptions {
  int? id;
  String? attributeId;
  String? label;
  int? position;
  List<Values>? values;
  int? productId;

  ConfigurableProductOptions(
      {this.id,
        this.attributeId,
        this.label,
        this.position,
        this.values,
        this.productId});

  ConfigurableProductOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    label = json['label'];
    position = json['position'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['label'] = this.label;
    data['position'] = this.position;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['product_id'] = this.productId;
    return data;
  }
}

class Values {
  int? valueIndex;

  Values({this.valueIndex});

  Values.fromJson(Map<String, dynamic> json) {
    valueIndex = json['value_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value_index'] = this.valueIndex;
    return data;
  }
}

class MediaGalleryEntries {
  int? id;
  String? mediaType;
  Null? label;
  int? position;
  bool? disabled;
  List<String>? types;
  String? file;

  MediaGalleryEntries(
      {this.id,
        this.mediaType,
        this.label,
        this.position,
        this.disabled,
        this.types,
        this.file});

  MediaGalleryEntries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    label = json['label'];
    position = json['position'];
    disabled = json['disabled'];
    types = json['types'].cast<String>();
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['label'] = this.label;
    data['position'] = this.position;
    data['disabled'] = this.disabled;
    data['types'] = this.types;
    data['file'] = this.file;
    return data;
  }
}

class CustomAttributes {
  String? attributeCode;
  dynamic? value;

  CustomAttributes({this.attributeCode, this.value});

  CustomAttributes.fromJson(Map<String, dynamic> json) {
    attributeCode = json['attribute_code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_code'] = this.attributeCode;
    data['value'] = this.value;
    return data;
  }
}

class SearchCriteria {
  // List<Null>? filterGroups;
  List<FilterGroups>? filterGroups;
  int? pageSize;

  SearchCriteria({this.filterGroups, this.pageSize});

  SearchCriteria.fromJson(Map<String, dynamic> json) {
    if (json['filter_groups'] != null) {
      filterGroups = <FilterGroups>[];
      json['filter_groups'].forEach((v) {
        filterGroups!.add(new FilterGroups.fromJson(v));
      });
    }
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filterGroups != null) {
      data['filter_groups'] =
          this.filterGroups!.map((v) => v.toJson()).toList();
    }
    data['page_size'] = this.pageSize;
    return data;
  }
}
class FilterGroups {
  List<Filters>? filters;

  FilterGroups({this.filters});

  FilterGroups.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(new Filters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Filters {
  String? field;
  String? value;
  String? conditionType;

  Filters({this.field, this.value, this.conditionType});

  Filters.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    value = json['value'];
    conditionType = json['condition_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['value'] = this.value;
    data['condition_type'] = this.conditionType;
    return data;
  }
}
