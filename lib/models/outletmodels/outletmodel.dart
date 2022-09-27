//@dart=2.9

class OutletModel {
  String id;
  String outletName;
  String outletCode;
  String outletAddress;
  String outletPhone;
  String invoicePrint;
  String startingDate;
  String invoiceFooter;
  String dateFormat;
  String timeZone;
  String currency;
  String currencyShow;
  String decimalShow;
  String decimalDigit;
  String decimalZeroHide;
  String outletMode;
  String showIngCode;
  String hppMode;
  String cekAksesBydb;
  String collectTax;
  String taxRegistrationTitle;
  String taxRegistrationNo;
  String taxTitle;
  String taxUseGlobal;
  String taxIsGst;
  String stateCode;
  String preOrPostPayment;
  String userId;
  String parentId;
  String orderId;
  String maxSub;
  String delStatus;

  OutletModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    outletName = json["outlet_name"];
    outletCode = json["outlet_code"];
    outletAddress = json["outlet_address"];
    outletPhone = json["outlet_phone"];
    invoicePrint = json["invoice_print"];
    startingDate = json["starting_date"];
    invoiceFooter = json["invoice_footer"];
    dateFormat = json["date_format"];
    timeZone = json["time_zone"];
    currency = json["currency"];
    currencyShow = json["currency_show"];
    decimalShow = json["decimal_show"];
    decimalDigit = json["decimal_digit"];
    decimalZeroHide = json["decimal_zero_hide"];
    outletMode = json["outlet_mode"];
    showIngCode = json["show_ing_code"];
    hppMode = json["hpp_mode"];
    cekAksesBydb = json["cek_akses_bydb"];
    collectTax = json["collect_tax"];
    taxRegistrationTitle = json["tax_registration_title"];
    taxRegistrationNo = json["tax_registration_no"];
    taxTitle = json["tax_title"];
    taxUseGlobal = json["tax_use_global"];
    taxIsGst = json["tax_is_gst"];
    stateCode = json["state_code"];
    preOrPostPayment = json["pre_or_post_payment"];
    userId = json["user_id"];
    parentId = json["parent_id"];
    orderId = json["order_id"];
    maxSub = json["max_sub"];
    delStatus = json["del_status"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
        "outlet_name": outletName,
        "outlet_code": outletCode,
        "outlet_address": outletAddress,
        "outlet_phone": outletPhone,
        "invoice_print": invoicePrint,
        "starting_date": startingDate,
        "invoice_footer": invoiceFooter,
        "date_format": dateFormat,
        "time_zone": timeZone,
        "currency": currency,
        "currency_show": currencyShow,
        "decimal_show": decimalShow,
        "decimal_digit": decimalDigit,
        "decimal_zero_hide": decimalZeroHide,
        "outlet_mode": outletMode,
        "show_ing_code": showIngCode,
        "hpp_mode": hppMode,
        "cek_akses_bydb": cekAksesBydb,
        "collect_tax": collectTax,
        "tax_registration_title": taxRegistrationTitle,
        "tax_registration_no": taxRegistrationNo,
        "tax_title": taxTitle,
        "tax_use_global": taxUseGlobal,
        "tax_is_gst": taxIsGst,
        "state_code": stateCode,
        "pre_or_post_payment": preOrPostPayment,
        "user_id": userId,
        "parent_id": parentId,
        "order_id": orderId,
        "max_sub": maxSub,
        "del_status": delStatus,
    };
  }
}