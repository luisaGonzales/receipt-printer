require './services/input_parser' 
require './services/receipt_printer'

items = InputParser.call(File.open(ARGV[0]))

ReceiptPrinter.call(items)
