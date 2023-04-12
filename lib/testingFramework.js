const style = function(text, code) {
  return "\033[" + code + "m" + text + "\033[0m";
}

const bold = function(text) {
  return style(text, 1);
}

const yellowFg = function(text) {
  return style(text, 32);
}

const redFg = function(text) {
  return style(text, 31);
}

const greenFg = function(text) {
  return style(text, 32);
}

const isExactlySame = function(actualValue, expectedValue) {
  return expectedValue === actualValue;
}

const isAlmostSame = function(actualValue, expectedValue, precision) {
  return (expectedValue >= actualValue - precision) && (expectedValue <= actualValue + precision);
}

const isSame = function(actualValue, expectedValue) {
  if (isExactlySame(actualValue, expectedValue)) {
    return true;
  }
  return isAlmostSame(actualValue, expectedValue, 0.01);
}

const printHeadline = function(headline) {
  console.log(bold(yellowFg(headline)));
}

const formatTestResultDetail = function(actual, expected) {
  const line1 = greenFg("\n\tExpected:  " + expected);
  const line2 =   redFg("\n\t  Actual:  " + actual);
  return line1 + line2;
}

const formatAssertionsMessage = function(result, actual, expected, message) {
  const icon = result ? "✅" : "❌";
  const summary = icon + " " + message;
  const details = formatTestResultDetail (actual, expected);

  return result ? summary : summary + details;
}

let totalAssertions = 0;
let passedAssertions = 0;
const testLog = [];

const getTotalAssertions = function() {
  return totalAssertions;
}

const getPassedAssertions = function() {
  return passedAssertions;
}

const updateAssertionCount = function(result) {
  totalAssertions += 1;
  passedAssertions += (result ? 1 : 0);
}

const addLog = function (testData) {
  testLog.push(testData);
}

const assertEqual = function(actual, expected, message) {
  const result = isSame(actual, expected);
  const currentTestData = {
    testCase: message,
    result: result,
    actual: actual,
    expected: expected
  }
  addLog(currentTestData);

  updateAssertionCount(result);
  console.log(formatAssertionsMessage(result, actual, expected, message));
}

const assertArrayEqual = function(actual, expected, message) {
  assertEqual(actual.toString(), expected.toString(), message);
}

const displayTestSummary = function() {
  let  message = "\nSummary: ";
  message += getPassedAssertions() + " / " + getTotalAssertions();
  message += " passed";
  console.log(message);
}

exports.printHeadline = printHeadline;
exports.assertEqual = assertEqual;
exports.assertArrayEqual = assertArrayEqual;
exports.displayTestSummary = displayTestSummary;
