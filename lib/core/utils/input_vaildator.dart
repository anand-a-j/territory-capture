class InputVaildator {
  static String? requiredHabitName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name can’t be empty';
    }
    return null;
  }
}
