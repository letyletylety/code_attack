List<List<List>> tripleNestedList(int len, [dynamic defaultValue = 0]) {
  return List.generate(
    len,
    (_) => List.generate(
      len,
      (_) => List.generate(len, (_) => defaultValue),
    ),
  );
}

List<List<List>> tripleNestedListWithSize(int z, int y, int x,
    {dynamic defaultValue = 0}) {
  return List.generate(
    z,
    (_) => List.generate(
      y,
      (_) => List.generate(x, (_) => defaultValue),
    ),
  );
}
