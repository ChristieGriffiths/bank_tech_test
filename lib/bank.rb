require 'date'

class Bank
  def initialize(initial_deposit, date)
    validate_amount(initial_deposit)
    @transaction_history = TransactionHistory.new
    @transaction_history.add(initial_deposit, date)
  end

  def deposit(amount, date)
    validate_amount(amount)
    @transaction_history.add(amount, date)
  end

  def withdraw(amount, date)
    validate_amount(amount)
    @transaction_history.add(-amount, date)
  end

  def validate_amount(amount)
    raise 'Amount must be an integer' unless amount.is_a?(Integer) && amount.positive?
  end

  def statement
    @transaction_history.statement
  end
end

class TransactionHistory
  def initialize
    @dates = {}
    @balance = 0.00
  end

  def add(amount, date)
    validate_date(date)
    @balance += amount
    @dates[date_formatter(date)] = { amount => @balance }
  end

  def statement
    sorted_dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
    statement = "date || credit || debit || balance\n"

    sorted_dates.each do |date, data|
      amount = data.keys.first
      balance = data.values.first

      if amount.negative?
        statement += "#{date} || || #{to_two_decimal_places(amount * -1)} || #{to_two_decimal_places(balance)}\n"
      else
        statement += "#{date} || #{to_two_decimal_places(amount)} || || #{to_two_decimal_places(balance)}\n"
      end
    end

    statement
  end

  private

  def validate_date(date)
    raise 'Date must be a string' unless date.is_a?(String)

    pattern_checker = /^\d{2}-\d{2}-\d{4}$/
    raise 'Date must be inputted in the specific format dd-mm-yyyy' unless date.match(pattern_checker)
  end

  def date_formatter(date)
    date.gsub('-', '/')
  end

  def to_two_decimal_places(number)
    format('%.2f', number)
  end
end