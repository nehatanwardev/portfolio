/// A function that validates a string based on specific requirements.
///
/// Requirements:
/// - Length between 6 and 15 characters (inclusive)
/// - At least two digits that are not adjacent
/// - At least one lowercase letter
/// - At least one uppercase letter
/// - Exactly one special character from the list [$, %, >]
/// - No character should appear more than once (all characters must be unique)
///
/// Returns true if the string meets all requirements, false otherwise.
bool stringValidator(String input) {
  // Check length requirement (6-15 characters)
  if (input.length < 6 || input.length > 15) {
    return false;
  }

  // Check for unique characters (no duplicates)
  final Set<String> uniqueChars = {};
  for (int i = 0; i < input.length; i++) {
    if (!uniqueChars.add(input[i])) {
      return false; // Character already exists
    }
  }

  // Check for at least one lowercase letter
  bool hasLowercase = false;
  for (int i = 0; i < input.length; i++) {
    if (input[i].codeUnitAt(0) >= 97 && input[i].codeUnitAt(0) <= 122) {
      hasLowercase = true;
      break;
    }
  }
  if (!hasLowercase) {
    return false;
  }

  // Check for at least one uppercase letter
  bool hasUppercase = false;
  for (int i = 0; i < input.length; i++) {
    if (input[i].codeUnitAt(0) >= 65 && input[i].codeUnitAt(0) <= 90) {
      hasUppercase = true;
      break;
    }
  }
  if (!hasUppercase) {
    return false;
  }

  // Check for exactly one special character from the list [$, %, >]
  final specialChars = [r'$', '%', '>'];
  int specialCharCount = 0;

  for (int i = 0; i < input.length; i++) {
    if (specialChars.contains(input[i])) {
      specialCharCount++;
    }
  }

  if (specialCharCount != 1) {
    return false;
  }

  // Check for at least two digits that are not adjacent
  final List<int> digitPositions = [];
  for (int i = 0; i < input.length; i++) {
    if (input[i].codeUnitAt(0) >= 48 && input[i].codeUnitAt(0) <= 57) {
      digitPositions.add(i);
    }
  }

  // Check if we have at least two digits
  if (digitPositions.length < 2) {
    return false;
  }

  // Check if any digits are adjacent
  for (int i = 1; i < digitPositions.length; i++) {
    if (digitPositions[i] - digitPositions[i - 1] == 1) {
      return false; // Adjacent digits found
    }
  }

  // All requirements met
  return true;
}

// Test cases
void main() {
  // Valid cases
  assert(stringValidator('A5i8%b') == true);
  assert(stringValidator('A5i8%ba4I<') == true);
  assert(stringValidator('1AaBbCcDdEeFf6%') == true);
  assert(stringValidator('A3a1>0') == true);

  // Invalid cases
  // Text is shorter than six characters
  assert(stringValidator('A5i8%') == false);

  // Text is longer than 15 characters
  assert(stringValidator('A5i8%bcdefghijKLm3aBC0GCJI') == false);

  // Text contains fewer than two digits
  assert(stringValidator('AbcDEFGHIJ%') == false);

  // Digits are not separated
  assert(stringValidator('AbcDEFG345HIJ%') == false);

  // Text does not contain any lowercase letter
  assert(stringValidator('ABCDEFG3HIJ%7') == false);

  // Text does not contain any capital letter
  assert(stringValidator('abcdefg3hij\$7') == false);

  // Text does not contain any character from the list [$, %, >]
  assert(stringValidator('ABcdefg3hij7') == false);

  // Text contains more than one character from the list [$, %, >]
  assert(stringValidator('ABcdefg3h%ij7\$') == false);

  // The same character occurs more than once
  assert(stringValidator('AABcdefg3hij7') == false);

  print('All tests passed!');
}
