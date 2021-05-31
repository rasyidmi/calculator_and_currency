class Calculation {
  static List<String> numberPressed(
    String currentResult,
    String currentNumber,
    String addedNumber,
    bool isClear,
    String operatorr,
  ) {
    if (isClear) {
      List<String> results = ['', ''];
      String result;
      if (currentNumber.contains('.')) {
        result = double.parse(currentNumber + addedNumber).toString();
      } else {
        result = int.parse(currentNumber + addedNumber).toString();
      }
      results[0] = result;
      // results[1] = result;
      return results;
    } else {
      if (operatorr == '+') {
        // print('masok');
        return _addition(currentResult, currentNumber, addedNumber);
      } else if (operatorr == '-') {
        return _subtraction(currentResult, currentNumber, addedNumber);
      } else if (operatorr == '*') {
        return _multiplication(currentResult, currentNumber, addedNumber);
      } else if (operatorr == '/') {
        return _division(currentResult, currentNumber, addedNumber);
      }
    }
  }

  static List<String> delPressed(
    String currentData,
    String currentNumber,
    bool numberPressed,
    bool operatorPressed,
    String operatorr,
  ) {
    List<String> result = ['','',''];
    if (operatorPressed) {
      currentNumber = currentData;
      currentData = '';
      operatorr = '';
      result[0] = currentNumber;
      result[1] = currentData;
      result[2] = operatorr;
    } else if (numberPressed) {
      if (currentNumber.length == 1) {
        currentNumber = '';
        result[0] = currentNumber;
        result[1] = currentData;
        result[2] = operatorr;
      }
      else if (operatorr == '+') {
        currentNumber = currentNumber.substring(0, currentNumber.length-1);
        print(currentNumber);
        List<String> temp = _addition(currentData, currentNumber, '');
        result[0]= temp[0];
        result[1] = temp[1];
        result[2] = '+';
      }
      else if (operatorr == '-') {
        currentNumber = currentNumber.substring(0, currentNumber.length-1);
        List<String> temp = _subtraction(currentData, currentNumber, '');
        result[0]= temp[0];
        result[1] = temp[1];
        result[2] = '-';
      }
      else if (operatorr == '*') {
        currentNumber = currentNumber.substring(0, currentNumber.length-1);
        List<String> temp = _multiplication(currentData, currentNumber, '');
        result[0]= temp[0];
        result[1] = temp[1];
        result[2] = '*';
      }
      else if (operatorr == '/') {
        currentNumber = currentNumber.substring(0, currentNumber.length-1);
        List<String> temp = _division(currentData, currentNumber, '');
        result[0]= temp[0];
        result[1] = temp[1];
        result[2] = '/';
      } else {
        currentNumber = currentNumber.substring(0, currentNumber.length-1);
        result[0] = currentNumber;
        result[1] = currentData;
        result[2] = operatorr;
      }
    }
    return result;
  }

  static String commaPressed(
    String currentNumber,
  ) {
    if (currentNumber == '') {
      return '0.';
    } else if (currentNumber.substring(currentNumber.length - 1) == '.') {
      return currentNumber;
    } else {
      currentNumber = currentNumber + '.';
      return currentNumber;
    }
  }

  static List<String> plusMinusPressed(bool isPos, String currentNumber,
      String currentResult, String operatorr) {
    List<String> result = new List(2);
    if (isPos) {
      currentNumber = '-' + currentNumber;
      result[0] = currentNumber;
      if (currentNumber == '-') {
        result[1] = '';
        return result;
      } else if (operatorr == '+') {
        currentResult =
            (double.parse(currentResult) + double.parse(currentNumber))
                .toString();
      } else if (operatorr == '-') {
        currentResult =
            (double.parse(currentResult) - double.parse(currentNumber))
                .toString();
      } else if (operatorr == '*') {
        currentResult =
            (double.parse(currentResult) * double.parse(currentNumber))
                .toString();
      } else if (operatorr == '/') {
        currentResult =
            (double.parse(currentResult) / double.parse(currentNumber))
                .toString();
      }
      result[1] = currentResult;
      return result;
    } else {
      currentNumber.length == 1
          ? currentNumber = ''
          : currentNumber = currentNumber.substring(1);
      result[0] = currentNumber;
      if (currentNumber == '') {
        result[1] = '';
        return result;
      } else if (operatorr == '+') {
        currentResult =
            (double.parse(currentResult) + double.parse(currentNumber))
                .toString();
      } else if (operatorr == '-') {
        currentResult =
            (double.parse(currentResult) - double.parse(currentNumber))
                .toString();
      } else if (operatorr == '*') {
        currentResult =
            (double.parse(currentResult) * double.parse(currentNumber))
                .toString();
      } else if (operatorr == '/') {
        currentResult =
            (double.parse(currentResult) / double.parse(currentNumber))
                .toString();
      }
      result[1] = currentResult;
      return result;
    }
  }

  static List<String> _addition(
    String currentResult,
    String currentNumber,
    String addedNumber,
  ) {
    List<String> result = ['', ''];
    result[0] = currentNumber + addedNumber;
    if (currentResult.contains('.') || currentNumber.contains('.')) {
      result[1] =
          (double.parse(currentResult) + double.parse(result[0])).toString();
    } else {
      // print(currentResult);
      result[1] = (int.parse(currentResult) + int.parse(result[0])).toString();
    }

    return result;
  }

  static List<String> _subtraction(
    String currentResult,
    String currentNumber,
    String addedNumber,
  ) {
    List<String> result = ['', ''];
    result[0] = currentNumber + addedNumber;
    if (currentResult.contains('.') || currentNumber.contains('.')) {
      result[1] =
          (double.parse(currentResult) - double.parse(result[0])).toString();
    } else {
      result[1] = (int.parse(currentResult) - int.parse(result[0])).toString();
    }

    return result;
  }

  static List<String> _division(
    String currentResult,
    String currentNumber,
    String addedNumber,
  ) {
    List<String> result = ['', ''];
    result[0] = currentNumber + addedNumber;
    result[1] =
        (double.parse(currentResult) / double.parse(result[0])).toString();
    return result;
  }

  static List<String> _multiplication(
    String currentResult,
    String currentNumber,
    String addedNumber,
  ) {
    List<String> result = ['', ''];
    result[0] = currentNumber + addedNumber;
    if (currentResult.contains('.') || currentNumber.contains('.')) {
      result[1] =
          (double.parse(currentResult) * double.parse(result[0])).toString();
    } else {
      result[1] = (int.parse(currentResult) * int.parse(result[0])).toString();
    }

    return result;
  }
}
