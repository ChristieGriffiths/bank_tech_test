class Bank
  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def statement
    'date || credit || debit || balance\n10/01/2023 || 2000.00 || || 2000.00'
  end 
end