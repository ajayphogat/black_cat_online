const String serverURL = "https://www.blackcatonline.com";
const String baseURL = serverURL + "/index.php/rest/V1/";
const String productImage = serverURL + "/pub/media/catalog/product/cache/77bffe63aab4a0de809337755b9a2009";


const String loginUrl = baseURL + "integration/customer/token";
const String registerUrl = serverURL + "/rest/V1/customers";
const String adminUrl = baseURL + "integration/admin/token";
const String allProductsUrl = baseURL + "products/?searchCriteria[pageSize]=1000";
const String  categoriesUrl = baseURL + "categories";
const String singleProductUrl = baseURL + "products?";
const String quotesUrl = baseURL + "carts/mine/";
const String addcartUrl = baseURL + "carts/mine/items";
const String deleteItemUrl =serverURL+ "/rest/V1/carts/mine/items/";
const String showProfileUrl =serverURL+ "/rest/V1/customers/me";

