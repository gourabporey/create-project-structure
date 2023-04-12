const testing = require("../lib/testing.js");
const FILE_IN_CC = require("../src/PROJECT.js");

const printHeadline = testing.printHeadline;
const assertEqual = testing.assertEqual;
const displayTestSummary = testing.displayTestSummary;
const main = FILE_IN_CC.main;

const runTestForFILE_IN_PC = function() {
  printHeadline("Testing for FILE_IN_CC");
  assertEqual(main(0), 0, "Should be 0 for input of 0");
  assertEqual(main(1), 0, "Should be 0 for input of 1");
  displayTestSummary();
}

runTestForFILE_IN_PC();
