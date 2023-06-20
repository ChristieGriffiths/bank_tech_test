require 'date'

class Bank
  def initialize(initial_deposit, date)
    deposit_checker(initial_deposit)
    date_checker(date)
    @dates = {}
    @balance = 0.00
    add(initial_deposit, date)
  end

  def deposit_checker(user_input)
    raise 'Must be a positive integer' unless user_input.is_a?(Integer) && user_input.positive?
  end 

  def date_checker(user_input)
    pattern_checker = /^\d{2}-\d{2}-\d{4}$/
    raise 'date must be inputted in this specific format dd-mm-yyyy' unless user_input.match(pattern_checker)
  end

  def date_formater(date)
    date.gsub('-', '/')
  end 

  def to_two_decimal_places(number)
    format('%.2f', number)
  end


  def add(deposit, date)
    deposit_checker(deposit)
    @balance += deposit
    @dates[date_formater(date)] = {deposit => @balance}
  end

  def withdraw(amount, date)
    deposit_checker(amount)
    @balance -= amount
    @dates[date_formater(date)] = {-amount => @balance}
  end 
  
  def statement
    @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
    account = "date || credit || debit || balance\n"
    @dates.each do |date, data|
      deposit = data.keys.first
      balance = data.values.first
      if deposit.negative?
        account += "#{date} || || #{to_two_decimal_places(deposit * -1)} || #{to_two_decimal_places(balance)}\n"
      else
        account += "#{date} || #{to_two_decimal_places(deposit)} || || #{to_two_decimal_places(balance)}\n"
      end
    end
    account
  end
end

client = Bank.new(1000, '10-10-1000')
client.statement