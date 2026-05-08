import 'package:flutter/foundation.dart';

class CanvaValidatorProvider extends ChangeNotifier {
  String _heightValidate = '';
  String _widthValidate = '';

  String get heightValidate => _heightValidate;
  String get widthValidate => _widthValidate;

  void clearAllError() {
    _heightValidate = '';
    _widthValidate = '';
    notifyListeners();
  }

  String? setValidateHeight(String value) {
    value = value.trim();

    if (value.isEmpty) {
      _heightValidate = 'Please enter height';
    } else {
      final height = double.tryParse(value);

      if (height == null) {
        _heightValidate = 'Please enter valid height';
      } else if (height <= 0) {
        _heightValidate = 'Height must be greater than 0';
      } else {
        _heightValidate = '';
      }
    }

    notifyListeners();
    return _heightValidate.isEmpty ? null : _heightValidate;
  }

  String? setValidateWidth(String value) {
    value = value.trim();

    if (value.isEmpty) {
      _widthValidate = 'Please enter width';
    } else {
      final height = double.tryParse(value);

      if (height == null) {
        _widthValidate = 'Please enter valid width';
      } else if (height <= 0) {
        _widthValidate = 'Width must be greater than 0';
      } else {
        _widthValidate = '';
      }
    }

    notifyListeners();
    return _widthValidate.isEmpty ? null : _widthValidate;
  }

  void clearError(String fieldName) {
    switch (fieldName) {
      case 'heightValidate':
        _heightValidate = "";
        break;
      case 'widthValidate':
        _widthValidate = '';
        break;
      default:
        debugPrint("$fieldName is not a valid field name");
        break;
    }
    notifyListeners();
  }
}
