/*
class HomeModel {
  List<Items>? items;
  SearchCriteria? searchCriteria;
  int? totalCount;

  HomeModel({this.items, this.searchCriteria, this.totalCount});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    searchCriteria = json['search_criteria'] != null
        ? new SearchCriteria.fromJson(json['search_criteria'])
        : null;
    totalCount = json['total_count'];
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

class Items {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  String? children;
  String? createdAt;
  String? updatedAt;
  String? path;
  // List<Null>? availableSortBy;
  bool? includeInMenu;
  List<CustomAttributes>? customAttributes;

  Items(
      {this.id,
        this.parentId,
        this.name,
        this.isActive,
        this.position,
        this.level,
        this.children,
        this.createdAt,
        this.updatedAt,
        this.path,
        // this.availableSortBy,
        this.includeInMenu,
        this.customAttributes});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    children = json['children'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    path = json['path'];
    // if (json['available_sort_by'] != null) {
    //   availableSortBy = <Null>[];
    //   json['available_sort_by'].forEach((v) {
    //     availableSortBy!.add(new Null.fromJson(v));
    //   });
    // }
    includeInMenu = json['include_in_menu'];
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
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['level'] = this.level;
    data['children'] = this.children;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['path'] = this.path;
    // if (this.availableSortBy != null) {
    //   data['available_sort_by'] =
    //       this.availableSortBy!.map((v) => v.toJson()).toList();
    // }
    data['include_in_menu'] = this.includeInMenu;
    if (this.customAttributes != null) {
      data['custom_attributes'] =
          this.customAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomAttributes {
  String? attributeCode;
  String? value;

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
  List<FilterGroups>? filterGroups;

  SearchCriteria({this.filterGroups});

  SearchCriteria.fromJson(Map<String, dynamic> json) {
    if (json['filter_groups'] != null) {
      filterGroups = <FilterGroups>[];
      json['filter_groups'].forEach((v) {
        filterGroups!.add(new FilterGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filterGroups != null) {
      data['filter_groups'] =
          this.filterGroups!.map((v) => v.toJson()).toList();
    }
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


*/


class HomeModel {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;
  List<CategoriesData>? childrenData;

  HomeModel(
      {this.id,
        this.parentId,
        this.name,
        this.isActive,
        this.position,
        this.level,
        this.productCount,
        this.childrenData});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    if (json['children_data'] != null) {
      childrenData = <CategoriesData>[];
      json['children_data'].forEach((v) {
        childrenData!.add(new CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['level'] = this.level;
    data['product_count'] = this.productCount;
    if (this.childrenData != null) {
      data['children_data'] =
          this.childrenData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;
  List<SubCategoriesData>? childrenData1;

  CategoriesData(
      {this.id,
        this.parentId,
        this.name,
        this.isActive,
        this.position,
        this.level,
        this.productCount,
        this.childrenData1});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    if (json['children_data'] != null) {
      childrenData1 = <SubCategoriesData>[];
      json['children_data'].forEach((v) {
        childrenData1!.add(new SubCategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['level'] = this.level;
    data['product_count'] = this.productCount;
    if (this.childrenData1 != null) {
      data['children_data'] =
          this.childrenData1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriesData {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;
  List<ProductData>? childrenData1;

  SubCategoriesData(
      {this.id,
        this.parentId,
        this.name,
        this.isActive,
        this.position,
        this.level,
        this.productCount,
        this.childrenData1});

  SubCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    if (json['children_data'] != null) {
      childrenData1 = <ProductData>[];
      json['children_data'].forEach((v) {
        childrenData1!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['level'] = this.level;
    data['product_count'] = this.productCount;
    if (this.childrenData1 != null) {
      data['children_data'] =
          this.childrenData1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ProductData {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;

  ProductData(
      {this.id,
        this.parentId,
        this.name,
        this.isActive,
        this.position,
        this.level,
        this.productCount});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['position'] = this.position;
    data['level'] = this.level;
    data['product_count'] = this.productCount;

    return data;
  }
}
