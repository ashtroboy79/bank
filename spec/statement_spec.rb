require 'statement'

describe Statement do
  it 'can print an empty statement' do
    statement = Statement.new
    expect { statement.print() }.to output("date       || credit  || debit  || balance \n").to_stdout
  end

  it 'can print statement' do
    statement = Statement.new
    transaction = [{ :date => "28/09/2021", :credit => 1000, :debit => "", :balance => 1000 }]
    expect { statement.print(transaction) }.to output("date       || credit  || debit  || balance \n28/09/2021 || 1000.00 ||  || 1000.00 \n").to_stdout
  end

  it 'can print a multi-transaction statement' do
    statement = Statement.new
    transaction1 = { :date => "27/09/2021", :credit => 1000, :debit => "", :balance => 1000 }
    transaction2 = { :date => "28/09/2021", :credit => "", :debit => 500, :balance => 500 }
    transactions = [transaction1, transaction2]
    test_str = "date       || credit  || debit  || balance \n28/09/2021 ||  || 500.00 || 500.00 \n27/09/2021 || 1000.00 ||  || 1000.00 \n"
    expect expect { statement.print(transactions) }.to output(test_str).to_stdout
  end
end
