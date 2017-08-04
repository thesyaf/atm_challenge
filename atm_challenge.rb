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

#The accounts balances
def balances(ret)
  case ret
    when 1
      $x = 100.12
    when 2
      $y = 234.56
    when 3
      $z = 10.00
  end
end

def withdraw
  puts "\nWhich account do you want to withdraw from?"
  puts menuItems
  # Capture the requested account to withdraw from
  withd = gets.to_i
  #Process the request
  case withd
    when 1
      balances(1)
      puts "\nThis account has $#{$x} \nHow much do you want to withdraw?"
      #Captures the amount to withdraw
      withdamt = gets.to_i
      #Determines the new balance after the withdrawal
      newbal = $x - withdamt
      puts "Processing...\n$#{withdamt} dispensed"
      puts "Your balance is now $#{newbal}"
        #How this bank deals with overdrawing.
        if newbal < 0
          puts "You are now overdrawn and will be charged at 90% interest per day.\n"
        end
    when 2
      balances(2)
      puts "\nThis account has $#{$y} \nHow much do you want to withdraw?"
      withdamt = gets.to_i
      newbal = $y - withdamt
      puts "Processing...\n$#{withdamt} dispensed"
      puts "Your balance is now $#{newbal}"
        if newbal < 0
          puts "You are now overdrawn and will be charged at 90% interest per day.\n"
        end
    when 3
      balances(3)
      puts "\nThis account has $#{$z} \nHow much do you want to withdraw?"
      withdamt = gets.to_i
      newbal = $z - withdamt
      puts "Processing...\n$#{withdamt} dispensed"
      puts "Your balance is now $#{newbal}"
        if newbal < 0
          puts "You are now overdrawn and will be charged at 90% interest per day.\n"
        end
    when 4
      menu
    else
      puts "Please input a valid option"
      withdraw
  end
end

def deposit
  puts "\nWhich account would you like to deposit into?"
  puts menuItems
  # Capture the requested account to deposit to
  depo = gets.to_i
  #Process the deposit
  case depo
    when 1
      balances(1)
      puts "This account has $#{$x} \nHow much are you depositing?"
      depamt = gets.to_i
      newbal = $x + depamt
      puts "Processing...\n$#{depamt} has been deposited to your account"
      puts "Your balance is now $#{newbal}\n"
    when 2
      puts "This account has $#{File.read('accounts.txt')} \nHow much are you depositing?"
      depamt = gets.to_i
      newbal = File.read('accounts.txt').to_i + depamt
      puts "Your new balance is $#{newbal}\n"
    when 3
      balances(3)
      puts "How much do you want to deposit into (acc name)"
    when 4
      menu
    else
      puts "Please input a valid option"
      deposit
  end
end

def check_balance
  puts "\nWhich account would you like to get the balance of?"
  puts menuItems
  # Capture the requested account to check balance
  bal = gets.to_i
  #Process the request
  case bal
    when 1
      balances(1)
      puts "Balance is #{$x}"
    when 2
      balances(2)
      puts "Balance is #{$y}"
    when 3
      balances(3)
      puts "Balance is #{$z}"
    when 4
      menu
    when 5
      break
    else
      puts "Please enter a valid option"
      check_balance
  end
end



#Start the program heres
puts "\n====Welcome to the MVP bank===="
menu
puts File.read("accounts.txt").each
