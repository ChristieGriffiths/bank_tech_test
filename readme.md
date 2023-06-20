# Bank Application

This is a simple Ruby application that simulates a bank account. It allows clients to make deposits, withdrawals, and generate account statements.

## Prerequisites

To run this application, you need to have Ruby and Rspec installed on your system.

To install Ruby & RSpec, you need to follow these steps:

1. Set up a Ruby development environment: Ensure that you have Ruby installed on your system. You can check if Ruby is already installed by opening a terminal or command prompt and running the following command:
   ```
   ruby --version
   ```
   If Ruby is not installed, you can download and install it from the official Ruby website (https://www.ruby-lang.org/en/downloads/).

2. Once Ruby is installed, you can install the RSpec gem by running the following command in your terminal or command prompt:
   ```
   gem install rspec
   ```
   This command will download and install the RSpec gem from the RubyGems repository.

3. Verify the installation: After the installation is complete, you can verify that RSpec is installed correctly by running the following command:
   ```
   rspec --version
   ```
   This command will display the version of RSpec installed on your system if the installation was successful.

That's it! RSpec is now installed on your system, and you can start using it.

## Getting Started

1. Clone this repository to your local machine or download the source code.
2. Open a terminal and navigate to the project directory.
3. Run the following command to execute the test suite and verify the functionality:

   ```
   ruby bank_spec.rb
   ```

## Usage

To use the Bank class in your own code, follow these steps:

1. Include the `bank.rb` file in your Ruby project:

   ```ruby
   require './bank'
   ```

2. Create a new instance of the Bank class with an initial deposit and a date:

   ```ruby
   client = Bank.new(2000, '10-01-2023')
   ```

   The date should be in the format 'dd-mm-yyyy'.

3. Perform transactions on the account:

   - To make a deposit:

     ```ruby
     client.add(1000, '15-01-2023')
     ```

   - To make a withdrawal:

     ```ruby
     client.withdraw(500, '20-01-2023')
     ```

4. Generate an account statement:

   ```ruby
   puts client.statement
   ```

   This will display a formatted statement with the transaction history, including dates, credits, debits, and the account balance.

## Testing

The application includes a test suite implemented with RSpec. You can run the tests by executing the following command in the terminal:

```
rspec bank_spec.rb
```
The test cases cover various scenarios, including making deposits, withdrawals, and verifying the statement output.

## Approach

I took the approach of TDD and creating the simplest possible test first and then incrementally increasing the complexity of them.  I finished my test with edge cases.

I've allowed the user to enter into debt as there was in the specifications there was no mention of not allowing them to. 

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Acknowledgments

The Bank application was developed as an exercise to demonstrate basic Ruby programming skills. It serves as a starting point for building more complex banking applications.