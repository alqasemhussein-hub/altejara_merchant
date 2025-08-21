filtterTextToNumber(String text) {
  RegExp regex = new RegExp(r'\d+');
  String numbers = regex
      .allMatches(text)
      .map((m) => m.group(0)!)
      .toList()
      .join('');

  return numbers;
}
