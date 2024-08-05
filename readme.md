# Receipt Printer

## Overview

This project is designed to simulate a shopping cart system that calculates the total price and applicable taxes for items in the cart. It includes the following main components:

- **Item**: Represents a product that can be added to the cart.
- **CartItem**: Represents an item added to the cart, including the quantity.
- **Cart**: Manages the collection of items added to the cart.
- **TaxCalculator**: A service that calculates the taxes for items based on predefined rules, such based or imported.
- **InputParser**: A service that parse the text input provided.
- **ReceiptPrinter**: A service that prints the receipt adding the total items and total sales tax.

The system supports different tax rates for different item types and ensures that tax calculations are rounded up to the nearest 0.05.

## Features

- Print items to the cart with specified quantities.
- Calculate total price including taxes.
- Print a detailed receipt with itemized costs and taxes.

## Project Structure

The project includes the following classes and services:

- **Item**: Defines the properties of an item.
- **CartItem**: Associates an item with a quantity in the cart.
- **Cart**: Manages the collection of cart items.
- **TaxCalculator**: Service to calculate taxes based on item type and price.
- **InputParser**: Service to parse inputs.
- **ReceiptPrinter**: Service that prints a Cart.

## Installation

1. **Clone the Repository**

   ```sh
   git clone https://github.com/luisaGonzales/receipt-printer.git
   cd receipt-printer
   ```
2. **Run main.rb**

   ```sh
   ruby main.rb ./inputs/input1.txt
   ```

## Testing

Using Rspec, tests has been added with the provided inputs and outputs. It can be run with: 

   ```sh
   rspec ./spec/services/receipt_printer_spec.rb
   ```
