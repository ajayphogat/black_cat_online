class CartModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  bool? isVirtual;
  List<CartItems>? items;
  int? itemsCount;
  int? itemsQty;
  Customer? customer;
  BillingAddress? billingAddress;
  int? origOrderId;
  Currency? currency;
  bool? customerIsGuest;
  bool? customerNoteNotify;
  int? customerTaxClassId;
  int? storeId;
  ExtensionAttributes? extensionAttributes;

  CartModel(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.isVirtual,
        this.items,
        this.itemsCount,
        this.itemsQty,
        this.customer,
        this.billingAddress,
        this.origOrderId,
        this.currency,
        this.customerIsGuest,
        this.customerNoteNotify,
        this.customerTaxClassId,
        this.storeId,
        this.extensionAttributes});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    isVirtual = json['is_virtual'];
    if (json['items'] != null) {
      items = <CartItems>[];
      json['items'].forEach((v) {
        items!.add(new CartItems.fromJson(v));
      });
    }
    itemsCount = json['items_count'];
    itemsQty = json['items_qty'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    origOrderId = json['orig_order_id'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    customerIsGuest = json['customer_is_guest'];
    customerNoteNotify = json['customer_note_notify'];
    customerTaxClassId = json['customer_tax_class_id'];
    storeId = json['store_id'];
    extensionAttributes = json['extension_attributes'] != null
        ? new ExtensionAttributes.fromJson(json['extension_attributes'])
        : null;
  }

}

class CartItems {
  int? itemId;
  String? sku;
  String? qty;
  String? name;
  String? price;
  String? productType;
  String? quoteId;

  CartItems(
      {this.itemId,
        this.sku,
        this.qty,
        this.name,
        this.price,
        this.productType,
        this.quoteId});

  CartItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    sku = json['sku'];
    qty = json['qty'].toString();
    name = json['name'];
    price = json['price'].toString();
    productType = json['product_type'];
    quoteId = json['quote_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['sku'] = this.sku;
    data['qty'] = this.qty;
    data['name'] = this.name;
    data['price'] = this.price;
    data['product_type'] = this.productType;
    data['quote_id'] = this.quoteId;
    return data;
  }
}

class Customer {
  int? id;
  int? groupId;
  String? createdAt;
  String? updatedAt;
  String? createdIn;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<BillingAddress>? addresses;
  int? disableAutoGroupChange;


  Customer(
      {this.id,
        this.groupId,
        this.createdAt,
        this.updatedAt,
        this.createdIn,
        this.email,
        this.firstname,
        this.lastname,
        this.storeId,
        this.websiteId,
        this.addresses,
        this.disableAutoGroupChange,
       });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdIn = json['created_in'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    storeId = json['store_id'];
    websiteId = json['website_id'];
    if (json['addresses'] != null) {
      addresses = <BillingAddress>[];
      json['addresses'].forEach((v) {
        addresses!.add(new BillingAddress.fromJson(v));
      });
    }
    disableAutoGroupChange = json['disable_auto_group_change'];
    // extensionAttributes = json['extension_attributes'] != null
    //     ? new ExtensionAttributes.fromJson(json['extension_attributes'])
    //     : null;
  }

}


class BillingAddress {
  int? id;
  dynamic? region;
  String? regionId;
  String? regionCode;
  String? countryId;
  List<String>? street;
  String? telephone;
  String? postcode;
  String? city;
  String? firstname;
  String? lastname;
  int? customerId;
  String? email;
  int? sameAsBilling;
  int? saveInAddressBook;

  BillingAddress(
      {this.id,
        this.region,
        this.regionId,
        this.regionCode,
        this.countryId,
        this.street,
        this.telephone,
        this.postcode,
        this.city,
        this.firstname,
        this.lastname,
        this.customerId,
        this.email,
        this.sameAsBilling,
        this.saveInAddressBook});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    region = json['region'];
    regionId = json['region_id'].toString();
    regionCode = json['region_code'];
    countryId = json['country_id'];
    street = json['street'].cast<String>();
    telephone = json['telephone'];
    postcode = json['postcode'];
    city = json['city'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    customerId = json['customer_id'];
    email = json['email'];
    sameAsBilling = json['same_as_billing'];
    saveInAddressBook = json['save_in_address_book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['region'] = this.region;
    data['region_id'] = this.regionId;
    data['region_code'] = this.regionCode;
    data['country_id'] = this.countryId;
    data['street'] = this.street;
    data['telephone'] = this.telephone;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['customer_id'] = this.customerId;
    data['email'] = this.email;
    data['same_as_billing'] = this.sameAsBilling;
    data['save_in_address_book'] = this.saveInAddressBook;
    return data;
  }
}

class Currency {
  String? globalCurrencyCode;
  String? baseCurrencyCode;
  String? storeCurrencyCode;
  String? quoteCurrencyCode;
  int? storeToBaseRate;
  int? storeToQuoteRate;
  int? baseToGlobalRate;
  int? baseToQuoteRate;

  Currency(
      {this.globalCurrencyCode,
        this.baseCurrencyCode,
        this.storeCurrencyCode,
        this.quoteCurrencyCode,
        this.storeToBaseRate,
        this.storeToQuoteRate,
        this.baseToGlobalRate,
        this.baseToQuoteRate});

  Currency.fromJson(Map<String, dynamic> json) {
    globalCurrencyCode = json['global_currency_code'];
    baseCurrencyCode = json['base_currency_code'];
    storeCurrencyCode = json['store_currency_code'];
    quoteCurrencyCode = json['quote_currency_code'];
    storeToBaseRate = json['store_to_base_rate'];
    storeToQuoteRate = json['store_to_quote_rate'];
    baseToGlobalRate = json['base_to_global_rate'];
    baseToQuoteRate = json['base_to_quote_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['global_currency_code'] = this.globalCurrencyCode;
    data['base_currency_code'] = this.baseCurrencyCode;
    data['store_currency_code'] = this.storeCurrencyCode;
    data['quote_currency_code'] = this.quoteCurrencyCode;
    data['store_to_base_rate'] = this.storeToBaseRate;
    data['store_to_quote_rate'] = this.storeToQuoteRate;
    data['base_to_global_rate'] = this.baseToGlobalRate;
    data['base_to_quote_rate'] = this.baseToQuoteRate;
    return data;
  }
}

class ExtensionAttributes {
  List<ShippingAssignments>? shippingAssignments;

  ExtensionAttributes({this.shippingAssignments});

  ExtensionAttributes.fromJson(Map<String, dynamic> json) {
    if (json['shipping_assignments'] != null) {
      shippingAssignments = <ShippingAssignments>[];
      json['shipping_assignments'].forEach((v) {
        shippingAssignments!.add(new ShippingAssignments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shippingAssignments != null) {
      data['shipping_assignments'] =
          this.shippingAssignments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingAssignments {
  Shipping? shipping;
  List<CartItems>? items;

  ShippingAssignments({this.shipping, this.items});

  ShippingAssignments.fromJson(Map<String, dynamic> json) {
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    if (json['items'] != null) {
      items = <CartItems>[];
      json['items'].forEach((v) {
        items!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shipping {
  BillingAddress? address;
  Null? method;

  Shipping({this.address, this.method});

  Shipping.fromJson(Map<String, dynamic> json) {
    address = json['address'] != null
        ? new BillingAddress.fromJson(json['address'])
        : null;
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['method'] = this.method;
    return data;
  }
}