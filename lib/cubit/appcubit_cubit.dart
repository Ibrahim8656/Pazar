import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/Cart/Cart.dart';
import 'package:flutter_application_4/Ui/home/Categories/Categories2.dart';
import 'package:flutter_application_4/Ui/home/Categories/Catigories.dart';
import 'package:flutter_application_4/Ui/home/Categories/pro.dart';
import 'package:flutter_application_4/Ui/home/Favoritss.dart/favorits.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/model/AddandremoveCartmodel.dart';
import 'package:flutter_application_4/model/CAticoreismodel.dart';
import 'package:flutter_application_4/model/Cartmodel.dart';
import 'package:flutter_application_4/model/Catigoreis.dart';
import 'package:flutter_application_4/model/Favoraitsmodel.dart';
import 'package:flutter_application_4/model/changeingfavemodle.dart';
import 'package:flutter_application_4/model/productmodle.dart';
import 'package:flutter_application_4/sheared/Diohelper.dart';
import 'package:flutter_application_4/sheared/ShearedPrefrences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class Shopcupit extends Cubit<Shopstates> {
  Shopcupit() : super(intialState());
  ProductResponse? productmodel;
  BannerModel? Banneres;
  ProductData? productData;
  CategoryModel? categoryModel;
  List<dynamic>? categories;
  FavoritesResponse? favoritesResponse;
  CartResponse?cartResponse;
  List<ProductModel> favproducts = [];
  List<ProductModel> Cartproducts = [];
  List<dynamic> productsofCatigory = [];
  Changeingfavemodle? changeingfavemodle;
  ChangeingCartemodle?changeingCartemodle;
  Color? faveColor;
  Map<int, bool> favorits = {};
  Map<int, bool> inCart = {};
  List<ProductModel> Allproducts = [];
  List<ProductDataa> FavProductList = [];
  List<CartItem> CartProductList = [];
  CatigoryProductModel? catigoryProductModel;
  static Shopcupit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<Widget> Screens = [
    Pro(),
    Categories2(),
    Favorits(),
    Cart(),
  ];
 void selectNumber(int number) => emit(numberState()); 
  void OntapOfbottomnavigatorbar(int index) {
    CurrentIndex = index;
    emit(OntapOfbottomnavigatorbarState());
  }

  gitProducts() {
    emit(lodingProductState());
    Diohelper.getdata(url: 'home', token: CashHelper.Getdata('token') ?? '')
        .then((value) {
      productmodel = ProductResponse.fromJson(value.data);
      List<BannerModel> Banneres = productmodel!.data.banners;
      productData = productmodel!.data;
      Allproducts = productmodel!.data.products;
      productmodel!.data.products.forEach((element) {
        favorits.addAll({element.id: element.inFavorites});
      });
      productmodel!.data.products.forEach((element) {
        inCart.addAll({element.id: element.inCart});
      });
      if (productmodel != null)
        for (var product in productmodel!.data.products) {
          if (product.inFavorites) favproducts.add(product);
        }
      if (productmodel != null)
        for (var product in productmodel!.data.products) {
          if (product.inCart) Cartproducts.add(product);
        }
      emit(GetProductState());
    }).catchError((onError) {
      print('dddddddddddddddddd');
      print(onError.toString());
      emit(GetProductErrorState(onError));
    });
  }

  GitCatigories() {
    emit(GetCatigoriesLodingState());
    Diohelper.getdata(
      url: 'categories',
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      categories = categoryModel!.data.categories;
      emit(GetCatigoriesState());
    }).catchError((onError) {
      print('caaaaaaaa');
      print(onError.toString());
      emit(GetCatigoriesErrorState());
    });
  }

  AddandRemoveFavorit(int id) {
    if (favorits[id] == true) {
      favorits[id] = false;
    } else if (favorits[id] == false) {
      favorits[id] = true;
    }
    Diohelper.Postdata(
      url: 'favorites',
      token: CashHelper.Getdata('token') ?? '',
      data: {"product_id": id},
    ).then((value) {
      changeingfavemodle = Changeingfavemodle.fromJson(value.data);
      if (changeingfavemodle!.status) {
        GitFavoritsProducts();
       gitProducts();
      }
      print(changeingfavemodle!.message);
      emit(CahngeFAvetsuccessState());
    }).catchError((onError) {
      emit(CahngeFAvetErrorState());
    });
  }

  GitFavoritsProducts() {
    emit(lodingFavoritsProducts());
    Diohelper.getdata(
            url: 'favorites', token: CashHelper.Getdata('token') ?? '')
        .then((value) {
      favoritesResponse = FavoritesResponse.fromJson(value.data);
      FavProductList = favoritesResponse!.data!.data;

      emit(GitFAvetsuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GitFAvetErrorState());
    });
  }

    AddandRemoveCart(int id) {
    if (favorits[id] == true) {
      favorits[id] = false;
    } else if (favorits[id] == false) {
      favorits[id] = true;
    }
    Diohelper.Postdata(
      url: 'carts',
      token: CashHelper.Getdata('token') ?? '',
      data: {"product_id": id},
    ).then((value) {
      changeingCartemodle = ChangeingCartemodle.fromJson(value.data);
      if (changeingCartemodle!.status) {
        
       gitProducts();
       GitCartProducts();
      }
      print(changeingfavemodle!.message);
      emit(CahngeCarttsuccessState());
    }).catchError((onError) {
      emit(CahngeCartErrorState());
    });
  }

  GitCartProducts() {
    emit(lodingCartProducts());
    Diohelper.getdata(
            url: 'carts', token: CashHelper.Getdata('token') ?? '')
        .then((value) {
      cartResponse = CartResponse.fromJson(value.data);
      CartProductList = cartResponse!.data!.cartItems;
      emit(GitCartuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GitCartErrorState());
    });
  }


  GitProductsOfCatigory(int CatigoryIdd) {
    emit(lODINGGitProductsOfCatigorystate());
    Diohelper.getdata(
            url: 'categories/$CatigoryIdd',
            token: CashHelper.Getdata('token') ?? '')
        .then((value) {
      catigoryProductModel = CatigoryProductModel.fromJson(value.data);
      productsofCatigory = catigoryProductModel!.data!.products;
      print(productsofCatigory);
      emit(GitProductsOfCatigorystate());
    }).catchError((e) {
      print(e.toString());
      emit(GitProductsOfCatigoryError());
    });
  }
double total_price=0.0;
GitTotalcost(List<CartItem> product){
  total_price=0.0;
for(int i=0;i<product.length;i++){
 total_price +=product[i].product.price;
}
return total_price;
}

}
