class Statement

  def print(transactions = [])
    puts 'date       || credit  || debit  || balance '
    transactions.each do | transaction | 
      puts "#{transaction[:date]} || #{format(transaction[:credit])} || #{format(transaction[:debit])} || #{format(transaction[:balance])}"
    end
  end

  def format(value)
    if value.is_a?Integer 
      value = "#{'%0.2f' % value}"
    end
  end

end
