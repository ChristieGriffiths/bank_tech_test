require 'bank'

describe Bank do
  it 'allows a client to make 1 deposit and print a statement' do
    client = Bank.new(2000, '10-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n10/01/2023 || 2000.00 || || 2000.00")
  end 
  it 'allows a client to make 1 deposit and print a statement' do
    client = Bank.new(1000, '14-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n14/01/2023 || 1000.00 || || 1000.00")
  end 
end