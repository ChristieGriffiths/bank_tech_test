require 'bank'

describe Bank do
  it 'allows a client to make a deposit and print a statement' do
    client = Bank.new(2000, '13-01-2023')
    expect(client.statement).to eq('date || credit || debit || balance\n10/01/2023 || 2000.00 || || 2000.00')
  end 
end