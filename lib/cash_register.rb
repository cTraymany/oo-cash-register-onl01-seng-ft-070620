require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :transaction
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end
  
  def add_item(item, price, quantity = 1)
    self.total = self.total + (price * quantity)
    count = 0
    until count == quantity
      self.items << item
      count += 1
    end
    self.transaction << price*quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total - ((self.discount/100.0) * self.total)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  
  def void_last_transaction
    self.items.pop
    self.total -= self.transaction[-1]
    self.total == 0.0 if self.items.empty?
  end

end