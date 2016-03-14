function toChineseNumeral(num) {
  var numerals = {
    "-": "负",
    ".": "点",
    0: "零",
    1: "一",
    2: "二",
    3: "三",
    4: "四",
    5: "五",
    6: "六",
    7: "七",
    8: "八",
    9: "九",
    10: "十",
    100: "百",
    1000: "千",
    10000: "万"
  };
  var n = Math.abs(num);
  var result = num < 0 ? numerals["-"] : "";
  result += n < 1 ? numerals[0] : "";
  var decimal = /\d*\.(\d*)/g.exec(n.toString());
  for (var i = 5; i >= 0; i--) {
    var p = Math.pow(10, i);
    var c = Math.floor(n / p);
    if (n < p)
      continue;
    result += (i == 1 && (result == "" || result == numerals["-"]) && c == 1 ?
                   "" :
                   numerals[c]) +
              (i == 0 ? "" : numerals[p]);
    n %= p;
    if (i >= 2 && n < p / 10 && n > 1)
      result += numerals[0];
  }
  if (decimal != null) {
    result += numerals["."];
    for (var i in decimal[1]) result += numerals[parseInt(decimal[1][i])];
  }

  return result;
}

// console.log(toChineseNumeral(9));
// console.log(toChineseNumeral(-5));
// console.log(toChineseNumeral(0.5));
// console.log(toChineseNumeral(10));
// console.log(toChineseNumeral(110));
// console.log(toChineseNumeral(111));
// console.log(toChineseNumeral(1000));
// console.log(toChineseNumeral(10000));
// console.log(toChineseNumeral(10006));
// console.log(toChineseNumeral(10306.005));

// 负零点五零三六八四七 负零点零零五五八八一五二 负零点零零零八五四九六零四
console.log(toChineseNumeral(-0.5036847));
console.log(toChineseNumeral(-0.005588152));
console.log(toChineseNumeral(-0.0008549604));

// console.log(toChineseNumeral(-13004.5));
// console.log(toChineseNumeral(13014.53));
// console.log(toChineseNumeral(13044.5));
// console.log(toChineseNumeral(13579));
// console.log(toChineseNumeral(10579));
// console.log(toChineseNumeral(13079));
// console.log(toChineseNumeral(13509));
// console.log(toChineseNumeral(13570));
