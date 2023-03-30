List<List<List>> tripleNestedList(int len, [dynamic defaultValue = 0]) {
  return List.generate(
    len,
    (_) => List.generate(
      len,
      (_) => List.generate(len, (_) => defaultValue),
    ),
  );
}
