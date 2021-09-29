# Bank code quality 

## Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)                                                                                                                                               
Deposits, withdrawal.                                                                                                                                             
Account statement (date, amount, balance) printing.                                                                                                               
Data can be kept in memory (it doesn't need to be stored to a database or anything).                                                                             

## Acceptance criteria

Given a **client** makes a **deposit** of 1000 on 10-01-2012                                                                                                     
And a **deposit** of 2000 on 13-01-2012                                                                                                                           
And a **withdrawal** of 500 on 14-01-2012                                                                                                                         
When she **prints** her **bank statement**                                                                                                                       
Then she would see                                                                                                                                               

date       || credit  || debit  || balance                                                                                                                     	
14/01/2012 ||  || 500.00 || 2500.00																						                                                                                   
13/01/2012 || 2000.00 ||  || 3000.00																						                                                                                 
10/01/2012 || 1000.00 ||  || 1000.00																						                                                                                 

So looking at the above acceptance criteria, we can see that there are 3 things interacting, a client, an account and a way of printing out the statement. So the question is how many classes do I need, initially I was thinking of having 3 classes one for each, however currently the client class has no data specified for it as such I feel it is unnecessary. This leave me with two classes, as follows
  
  
|      Account        |                       |    Statement     |                                                                                      
|        :---:        |                       |     :---:        |                                                
|  balance            |                       |                  |                                                                                             
| transaction_history |                       |__________________|                                                                                             
|_____________________|                       |      print       |                                                                                             
| deposit             |                       |__________________|                                                                                             
| withdraw            |					                                                                                                                                 
| print_statement     |                                                                                                                                           
|_____________________|                                                                                                                                           

Now the question is how to hold the balance, as I'm going to have to store the transaction details in order to be able to print out the statement in the format needed, it would be possible to calculate the balance each time a statement is requested, or it could be the current balance thus there would be no need for a balance method. At the moment there is no requirement to display the balance independantly of a statement, nor is there explicitly any constraints on a negative balance. 

The time of a deposit and withdrawal will need to be stored together with the type of transaction, while I could've made a transaction class, the simplest method would be a hash of key value pairs representing date, credit, debit and balance, stored in a transaction history array.  In order to test the recording of the deposit it was necessary to stub the date of the transaction, to do so I used the Timecop gem. 

## Installation of dependancies 
Use the following commands in a terminal program
1. bundle install
2. rspec --init

## Usage in a REPL such as irb                                                                                                                                   
:001 > require "./lib/statement.rb"                                                                                                                               
:002 > require "./lib/account.rb"                                                                                                                                 
:003 > account = Account.new                                                                                                                                     
:004 > account.deposit(1000)                                                                                                                                     
:005 > account.deposit(2000)                                                                                                                                     
:006 > account.withdraw(500)                                                                                                                                     
:007 > account.print_statement                                                                                                                                   
date       || credit  || debit  || balance                                                                                                                       
28/09/2021 ||  || 500.00 || 2500.00                                                                                                                               
28/09/2021 || 2000.00 ||  || 3000.00                                                                                                                             
28/09/2021 || 1000.00 ||  || 1000.00     

## Running tests 
In a terminal program navigate to the project directory root and enter the following command
1. rspec

## Rspec and simple-cov results                                                                                                                    

Account                                                                                                                                                          
  creates a new account                                                                                                                                           
  starts with a balance of 0                                                                                                                                     
  can deposit money to the account                                                                                                                               
  can withdraw money from the account                                                                                                                             
  cannot withdraw more money than in the account                                                                                                                 
  can record details of a deposit transaction                                                                                                                     
  can record details of a withdrawal tranaction                                                                                                                   
  calls the print method for the statement class                                                                                                                

Statement                                                                                                                                                         
  can print an empty statement                                                                                                                                   
  can print statement                                                                                                                                             
  can print a multi-transaction statement                                                                                                                         

11 examples, 0 failures                                                                                                                                           

COVERAGE: 100.00% -- 79/79 lines in 4 files                                                                                                                       
