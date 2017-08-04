## Syafs ATM v0.1

def withdraw
end

def deposit
end

def check_balance

end


puts "====Welcome to the MVP bank===="
puts "What would like to do today?"
puts "(1) Check Balance, (2) Withdrawal, (3) Deposit"

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
end
