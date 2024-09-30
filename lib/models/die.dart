class Die {
  int _value;

  Die({required int initialValue})
      : assert(initialValue >= 1 && initialValue <= 6,
            'Initial value must be between 1 and 6'),
        _value = initialValue;

  int get value => _value;

  set value(int newValue) {
    if (newValue >= 1 && newValue <= 6) {
      _value = newValue;
    } else {
      throw ArgumentError('Die value must be between 1 and 6.');
    }
  }

  String getAssetString() {
    return _assets[_value] ?? "no dice lol";
  }

  static const Map<int, String> _assets = {
    1: 'assets/dice/dice-one.svg',
    2: 'assets/dice/dice-two.svg',
    3: 'assets/dice/dice-three.svg',
    4: 'assets/dice/dice-four.svg',
    5: 'assets/dice/dice-five.svg',
    6: 'assets/dice/dice-six.svg',
  };
}
