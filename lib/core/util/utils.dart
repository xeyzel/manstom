import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/model/transaction/transaction.dart';

class Utils {
  Utils._();

  static void showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static String capital(String text) {
    final texts = text.split(' ');
    final transforms =
        texts.map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase());
    return transforms.join(' ');
  }

  static Iterable<Product> sortByDate(Iterable<Product> products) {
    final rawProducts = products.toList();
    rawProducts.sort(
      (a, b) => DateTime.parse(b.createdAt)
          .millisecondsSinceEpoch
          .compareTo(DateTime.parse(a.createdAt).millisecondsSinceEpoch),
    );
    return rawProducts;
  }

  static Iterable<Product> sortByQuantity(Iterable<Product> products) {
    final rawProducts = products.toList();

    rawProducts.sort(
      (a, b) => a.quantity.compareTo(b.quantity),
    );
    return rawProducts;
  }

  static Iterable<Transaction> sortTransactionByDate(
      Iterable<Transaction> transactions) {
    var transactionSliced = transactions.toList();
    transactionSliced.sort(
      (a, b) => DateTime.parse(b.createdAt)
          .millisecondsSinceEpoch
          .compareTo(DateTime.parse(a.createdAt).millisecondsSinceEpoch),
    );
    return transactionSliced;
  }

  static String formatDate(String createdAt) {
    final date = DateTime.parse(createdAt);
    final formatting = DateFormat('EEEE, dd MMMM yyyy - HH:MM');
    return formatting.format(date);
  }

  static String formatNumberToIdr(int price) {
    final formatNumber = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatNumber.format(price);
  }
}
