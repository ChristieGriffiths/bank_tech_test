require 'bank'

describe Bank do
  it 'allows a client to make 1 deposit and print a statement' do
    client = Bank.new(2000, '10-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n10/01/2023 || 2000.00 || || 2000.00\n")
  end 
  it 'allows a client to make 1 deposit and print a statement' do
    client = Bank.new(1000, '14-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n14/01/2023 || 1000.00 || || 1000.00\n")
  end 
  it 'allows a client to make 2 deposit and print a statement' do
    client = Bank.new(1000, '14-01-2023')
    client.add(1000, '15-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n15/01/2023 || 1000.00 || || 2000.00\n14/01/2023 || 1000.00 || || 1000.00\n")
  end
  it 'allows a client to make 3 deposit and print a statement' do
    client = Bank.new(1000, '14-01-2023')
    client.add(1000, '15-01-2023')
    client.add(1000, '16-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n16/01/2023 || 1000.00 || || 3000.00
15/01/2023 || 1000.00 || || 2000.00\n14/01/2023 || 1000.00 || || 1000.00\n")
  end
  it 'allows a client to make 1 deposit, 1 withdrawal and  print a statement' do
    client = Bank.new(2000, '10-01-2023')
    client.withdraw(1000, '11-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n11/01/2023 || || 1000.00 || 1000.00\n10/01/2023 || 2000.00 || || 2000.00\n")
  end
  it 'allows a client to make 1 deposit, 2 withdrawal and  print a statement' do
    client = Bank.new(2000, '10-01-2023')
    client.withdraw(1000, '11-01-2023')
    client.withdraw(1000, '12-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n12/01/2023 || || 1000.00 || 0.00\n11/01/2023 || || 1000.00 || 1000.00\n10/01/2023 || 2000.00 || || 2000.00\n")
  end
  it 'allows a client to make 1 deposit, and withdraw into debt and then print a statement' do
    client = Bank.new(2000, '10-01-2023')
    client.withdraw(3000, '11-01-2023')
    expect(client.statement).to eq("date || credit || debit || balance\n11/01/2023 || || 3000.00 || -1000.00\n10/01/2023 || 2000.00 || || 2000.00\n")
  end
  it 'only allows client to input a integer when creating an account' do
    expect { Bank.new('test', '10-01-2023') }.to raise_error(RuntimeError)
  end
  it 'only allows client to input a positive integer when creating an account' do
    expect { Bank.new(-1000, '10-01-2023') }.to raise_error(RuntimeError)
  end
  it 'only allows client to input a positive integer when making a deposit an account' do
    client = Bank.new(2000, '10-01-2023')
    expect { -1000 }.to raise_error(RuntimeError)
  end
end