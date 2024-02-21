class SingleProductModel {
  List<SingleItems>? items;

  SingleProductModel({this.items});

  SingleProductModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <SingleItems>[];
      json['items'].forEach((v) {
        items!.add(new SingleItems.fromJson(v));
      });
    }
  }


}

class SingleItems {
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

  SingleItems(
      {this.id,
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

  SingleItems.fromJson(Map<String, dynamic> json) {
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

}

class ExtensionAttributes {
  List<int>? websiteIds;
  List<CategoryLinks>? categoryLinks;

  ExtensionAttributes({this.websiteIds, this.categoryLinks});

  ExtensionAttributes.fromJson(Map<String, dynamic> json) {
    websiteIds = json['website_ids'].cast<int>();
    if (json['category_links'] != null) {
      categoryLinks = <CategoryLinks>[];
      json['category_links'].forEach((v) {
        categoryLinks!.add(new CategoryLinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['website_ids'] = this.websiteIds;
    if (this.categoryLinks != null) {
      data['category_links'] =
          this.categoryLinks!.map((v) => v.toJson()).toList();
    }
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