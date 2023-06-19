class Bank
  def initialize(amount, date)
    @amount = format('%.2f', amount)
    @date = date.gsub('-', '/')
  end

  def statement
    "date || credit || debit || balance\n#{@date} || #{@amount} || || #{@amount}"
  end 
end