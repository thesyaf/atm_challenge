## Syafs ATM v0.1
def menuItems
  puts "(1) Savings Account \n(2) Daily Account \n(3) Term Account \n(4) Go back to menu"
end

def menu
  puts "\nWhat would you like to do today?"
  puts "(1) Check Balance \n(2) Withdrawal \n(3) Deposit"
  # Capture the task from the user
  task = gets.to_i
  # Process the request
  case task
    when 1
      check_balance
    when 2
      withdraw
    when 3
      deposit
    else
      puts "Please input a valid option"
      menu
  end
end

#The accounts balances stored in hash
def balances(ret)
  bal = {"1" => 100.23, "2" => 30.21, "3" => 0.92}
  $test = bal[ret.to_s]
end

def retran
  puts "\nWould you like to do another transaction?\n(y) to go back to menu\n(n) to quit"
  well = gets.chomp.to_s.downcase
  case well
    when "y"
      menu
    when "n"
      puts "====Thank you for banking with MVP===="
  end
end

def withdraw
  puts "\nWhich account do you want to withdraw from?"
  puts menuItems
  # Capture the requested account to withdraw from
  withd = gets.to_i
  #Send the selection to the withdrawal method
  case withd
    when 1
      balances(1)
    when 2
      balances(2)
    when 3
      balances(3)
    when 4
      menu
    else
      puts "Please input a valid option"
      withdraw
  end

  #Print the available balance and process
  puts "\nThis account has $#{$test} \nHow much do you want to withdraw?"
  withdamt = gets.to_i
  #Determines the new balance after the withdrawal
  newbal = $test - withdamt
  puts "Processing...\n$#{withdamt} dispensed"
  puts "Your balance is now $#{newbal}"
    #How this bank deals with overdrawing.
    if newbal < 0
      puts "You are now overdrawn and will be charged at 90% interest per day.\n"
    end
  retran
end

def deposit
  puts "\nWhich account would you like to deposit into?"
  puts menuItems
  depo = gets.to_i
  case depo
    when 1
      balances(1)
    when 2
      puts "This account has $#{File.read('accounts.txt')} \nHow much are you depositing?"
      depamt = gets.to_i
      newbal = File.read('accounts.txt').to_i + depamt
      puts "Your new balance is $#{newbal}\n"
    when 3
      balances(3)
    when 4
      menu
    else
      puts "Please input a valid option"
      deposit
  end

  puts "This account has $#{$test} \nHow much are you depositing?"
  depamt = gets.to_i
  newbal = $test + depamt
  puts "Processing...\n$#{depamt} has been deposited to your account"
  puts "Your balance is now $#{newbal}\n"
  retran

end

def check_balance
  puts "\nWhich account would you like to get the balance of?"
  puts menuItems
  # Capture the requested account to check balance
  bal = gets.to_i
  case bal
    when 1
      balances(1)
    when 2
      balances(2)
    when 3
      balances(3)
    when 4
      menu
    else
      puts "Please enter a valid option"
      check_balance
  end

  puts "Balance is #{$test}"
  retran

end



#Start the program heres
puts "\n====Welcome to the MVP bank===="
menu
