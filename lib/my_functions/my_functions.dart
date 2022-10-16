import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//*color

colorPurpleLight() {
  return const Color.fromRGBO(234, 228, 254, 1);
}

colorNavBlue() {
  return const Color.fromRGBO(95, 51, 226, 1);
}

colorNavLight() {
  return const Color.fromRGBO(192, 175, 245, 1);
}

colorBlue() {
  return const Color.fromRGBO(109, 74, 254, 1);
}

colorPink() {
  return const Color.fromRGBO(246, 119, 186, 1);
}

colorYellow() {
  return const Color.fromRGBO(254, 229, 163, 1);
}
//padding

paddingFunction(width, height, {bottom = 0.0}) {
  return EdgeInsets.fromLTRB(
    0.05 * width,
    0.02 * height,
    0.05 * width,
    bottom,
  );
}

paddingFunctionNotop(width, height, {bottom = 0.0, top = 0.0}) {
  return EdgeInsets.fromLTRB(
    0.05 * width,
    top,
    0.05 * width,
    bottom,
  );
}

//*Text

headText(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )));
}

headTextWhite(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

headTextWhiteCenter(text, {Color: Colors.black}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

bodyText(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )));
}

bodyTextblue(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: colorBlue(),
      )));
}

bodyTextWhite(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

headTextCenter(text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontSize: 42, fontWeight: FontWeight.w600, color: Colors.white)));
}

headTextCenterBlack(text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontSize: 42, fontWeight: FontWeight.w600, color: Colors.black)));
}

sizedBoxHere(height) {
  return SizedBox(
    height: 0.03 * height,
  );
}
//*Bottom NAvigation

bottomNavigation(width, height, {currentIndex1 = 0}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
      0.05 * width,
      0,
      0.05 * width,
      0.05 * width,
    ),
    child: Container(
      decoration: decorateContainer(color: colorNavBlue()),
      height: 0.11 * height,
      width: width,
      child: Padding(
        // padding: EdgeInsets.all(0),
        padding: EdgeInsets.fromLTRB(
          0.08 * width,
          0,
          0.08 * width,
          0.00 * width,
        ),
        child: BottomNavigationBar(
            currentIndex: currentIndex1,
            onTap: (newIndex) {
              print(newIndex);
            },
            backgroundColor: colorPurpleLight(),
            selectedItemColor: colorNavBlue(),
            unselectedItemColor: colorNavLight(),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Menu"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.file_copy), label: "List"),
            ]),
      ),
    ),
  );
}

//*container style

decorateContainer({color}) {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 9.0,
      ),
    ],
    borderRadius: BorderRadius.circular(20),
    color: color,
  );
}

decorateContainerBlackShadow({color}) {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 59, 59, 59),
        blurRadius: 9.0,
      ),
    ],
    borderRadius: BorderRadius.circular(20),
    color: color,
  );
}

//*container shadow

shadowContainer() {
  return [
    const BoxShadow(
        color: Color.fromARGB(255, 125, 125, 125),
        blurRadius: 7,
        offset: Offset(0.0, 3.0))
  ];
}

//*input area

inputBox(controllarName, hinttext, {initValue}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Field is empty';
      }
      return null;
    },
    initialValue: initValue,
    controller: controllarName,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(),
        hintText: hinttext),
  );
}

inputBoxNum(controllarName, hinttext, {initValue}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Field is empty';
      }
      return null;
    },
    initialValue: initValue,
    keyboardType: TextInputType.number,
    controller: controllarName,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(),
        hintText: hinttext),
  );
}

textInfoRow(String text, String infoText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [bodyTextWhite('$text  '), bodyTextWhite(infoText)],
  );
}

textInfoRowBlack(String text, String infoText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [bodyText('$text  '), bodyTextWhite(infoText)],
  );
}

//*imagelist
List proImages = [
  'assets/images/1.jpeg',
  'assets/images/2.jpeg',
  'assets/images/3.jpeg',
  'assets/images/4.jpeg',
  'assets/images/5.jpeg',
  'assets/images/6.jpeg',
  'assets/images/7.jpeg',
  'assets/images/8.jpeg',
  'assets/images/9.jpeg',
  'assets/images/10.jpeg',
  'assets/images/11.jpeg',
  'assets/images/12.jpeg',
  'assets/images/13.jpeg',
  'assets/images/14.jpeg',
  'assets/images/15.jpeg',
  'assets/images/17.jpeg',
  'assets/images/18.jpeg',
  'assets/images/19.jpeg',
  'assets/images/20.jpeg',
  'assets/images/21.jpeg',
  'assets/images/22.jpeg',
  'assets/images/23.jpeg',
  'assets/images/24.jpeg',
  'assets/images/25.jpeg',
  'assets/images/26.jpeg',
  'assets/images/27.jpeg',
  'assets/images/28.jpeg',
  'assets/images/29.jpeg',
  'assets/images/30.jpeg',
  'assets/images/31.jpeg',
  'assets/images/32.jpeg',
  'assets/images/33.jpeg',
  'assets/images/35.jpeg',
  'assets/images/36.jpeg',
  'assets/images/34.jpeg',
];
