class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end
  
  def execute_transaction
    if @status == "pending" && valid?
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
  end
  
end


