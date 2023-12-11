import 'package:intl/intl.dart';

extension ExDouble on double {
  String toFormat() {
    String st = toStringAsFixed(4);
    while ((st[st.length - 1] == '.') || (st[st.length - 1] == '0')) {
      st = st.substring(0, st.length - 1);
    }
    return st;
  }

  String toVnd() {
    String st = '${toInt()}';
    String st2 = ' đ';

    int d = 0;
    for (int i = st.length - 1; i >= 0; i--) {
      st2 = '${st[i]}$st2';
      d++;
      if ((d == 3) && (i > 0)) {
        st2 = '.$st2';
        d = 0;
      }
    }
    return st2;
  }
}

extension ExString on String? {
  String toDateTimeFormat() {
    if (this == null) {
      return '--:--';
    }
    try {
      return DateFormat('d/M/yyyy')
          .format(DateTime.parse(this!).toLocal());
    } on FormatException {
      return '--:--';
    }
  }
}
