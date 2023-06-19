require 'date'

class Bank
  def initialize(initial_deposit, date)
    @initial_deposit = format('%.2f', initial_deposit)
    @date = date.gsub('-', '/')
    @dates = {}
    @balance = 0.00
    @balance += initial_deposit
  end

  def to_two_decimal_places(number)
    format('%.2f', number)
  end 

  def add(deposit, date)
    @balance += deposit
    date = date.gsub('-', '/')
    @dates[date] = {deposit => @balance}
    @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
    @dates
  end

  def statement
    account = "date || credit || debit || balance\n"
    @dates.each do |date, data|
      deposit = data.keys.first
      balance = data.values.first
      account += "#{date} || #{to_two_decimal_places(deposit)} || || #{to_two_decimal_places(balance)}\n"
    end
    account += "#{@date} || #{@initial_deposit} || || #{@initial_deposit}"
    account
  end
end