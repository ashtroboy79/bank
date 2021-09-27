# bank

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
14/01/2012 ||         || 500.00 || 2500.00																						
13/01/2012 || 2000.00 ||        || 3000.00																						
10/01/2012 || 1000.00 ||        || 1000.00																						

So looking at the above acceptance criteria, we can see that there are 3 things interacting, a client, an account and a way of printing out the statement. So the question is how many classes do I need, initially I was thinking of having 3 classes one for each, however currently the client class has no data specified for it as such I feel it is unnecessary. This leave me with two classes, as follows

|     Account      |                       |    Statement       |
====================                       ======================
| @balance         |  					   |                    |
| transaction      |                       ======================
====================                       |  print_statement   |
| deposit          |                       ======================
| withdraw         |					   
| balance(maybe)   |
| statement        |

Now the question is how to hold the balance, as I'm going to have to store the transaction details in order to be able to print out the statement in the format needed, it would be possible to calculate the balance each time a statement is requested, or it could be the current balance thus there would be no need for a balance method. At the moment there is no requirement to display the balance independantly of a statement, nor is there explicitly any constraints on a negative balance. 