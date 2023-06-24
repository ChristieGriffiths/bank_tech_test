require 'date'
require 'transaction_history'

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