require 'spec_helper'
require './services/receipt_printer'
require './services/input_parser'

RSpec.describe ReceiptPrinter do
  let(:items) { InputParser.call(File.open('./inputs/input1.txt')) }
  let(:printer) { ReceiptPrinter.new(items) }

  describe '#call' do
    it 'prints the receipt' do
      expect(printer).to receive(:print_receipt)
      printer.call
    end

    context "with first input" do
      it 'prints the full receipt' do
        expected_output = <<~OUTPUT
          2 book: 24.98
          1 music CD: 16.49
          1 chocolate bar: 0.85
          Sales Taxes: 1.50
          Total: 42.32
        OUTPUT
  
        expect { printer.call }.to output(expected_output).to_stdout
      end 
    end

    context "with second input" do
      let(:items) { InputParser.call(File.open('./inputs/input2.txt')) }

      it 'prints the full receipt' do
        expected_output = <<~OUTPUT
          1 imported box of chocolates: 10.50
          1 imported bottle of perfume: 54.65
          Sales Taxes: 7.65
          Total: 65.15
        OUTPUT
  
        expect { printer.call }.to output(expected_output).to_stdout
      end
    end

    context "with third input" do
      let(:items) { InputParser.call(File.open('./inputs/input3.txt')) }
      
      it 'prints the full receipt' do
        expected_output = <<~OUTPUT
          1 imported bottle of perfume: 32.19
          1 bottle of perfume: 20.89
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 35.55
          Sales Taxes: 7.90
          Total: 98.38
        OUTPUT
  
        expect { printer.call }.to output(expected_output).to_stdout
      end
    end
  end
end
