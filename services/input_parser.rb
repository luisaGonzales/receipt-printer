require './services/service_base'

class InputParser < ServiceBase
  PATTERN = /(\d+)\s+(.+?)\s+at\s+(\d+\.\d{2})/

  def initialize(input)
    @input = input
  end

  attr_reader :input

  def call
    items = []

    input.each_line do |line|
      match = line.match(PATTERN)
      item = {
        quantity: match[1].to_i,
        name: match[2],
        price: match[3].to_f
      }

      items.push(item)
    end

    items
  end
end
