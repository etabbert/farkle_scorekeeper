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
}
