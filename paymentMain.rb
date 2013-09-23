#Brandon Bosso
#Naomi Plasterer

#contains the "main" method (begin/end) for making payments
#loads the rules file
#prompts the users and "processes" payments until the user enters a sentinel value (I used 'quit').
#handle undefined product exceptions raised by the PaymentRules class

require_relative 'paymentRules.rb'
require_relative 'products.rb'

class PaymentMain
  def run_product
    rules = PaymentRules.new
    begin
        #check valid product then call product actions
      begin
        puts "Enter product type or 'quit' to end: "
        response = gets.chomps.downcase
        #check to see if response is legit product type
        checker = rules.processPayment(response)
        #if not loop through again
      end while(response != 'quit' || checker != true)
    end while (response != 'quit')
  end
  
  def load_business_rules(filename)
    load filename
    #products = Product.new
  end
  
end

#Main code
payment = PaymentMain.new
payment.load_business_rules('./businessRules.txt')
payment.run_product