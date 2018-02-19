require 'csv'

class ItemRepository

  def initialize(filepath)
    @items = []
    load_items(filepath)
  end

  def all
    @items
  end

  def load_items(filepath)
    CSV.foreach(filepath, headers: true, header_converters: :symbol) do |data|
      @items << Item.new(data)
    end
  end

  def find_by_id(id)
    @items.find { |item| item.id == id }
  end





end