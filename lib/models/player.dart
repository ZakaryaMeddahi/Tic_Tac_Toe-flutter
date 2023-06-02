class Player {
  String _name;
  String _choice;
  int _score;

  Player(this._name, this._choice, this._score);

  void setName(String name) {
    if (name.isEmpty) {
      _name = 'Player 1';
      return;
    }
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setChoice(String choice) {
    _choice = choice;
  }

  String getChoice() {
    return _choice;
  }

  void setScore(int score) {
    _score = score;
  }

  int getScore() {
    return _score;
  }
}
