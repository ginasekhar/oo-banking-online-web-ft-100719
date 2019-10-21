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
    sender
    @status = "complete"
  end
  
  def reverse_transfer
  end
  
end


__________________________________________________________________


  

    

    it "rejects a transfer if the sender does not have enough funds (does not have a valid account)" do
      terrance.close_account
      closed_account_transfer = Transfer.new(amanda, terrance, 50)
      expect(closed_account_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
      expect(closed_account_transfer.status).to eq("rejected")

      expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
      expect(bad_transfer.status).to eq("rejected")
    end
  end

  describe '#reverse_transfer' do
    it "can reverse a transfer between two accounts" do
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      transfer.reverse_transfer
      expect(avi.balance).to eq(1000)
      expect(amanda.balance).to eq(1000)
      expect(transfer.status).to eq("reversed")
    end

    it "it can only reverse executed transfers" do
      transfer.reverse_transfer
      expect(amanda.balance).to eq(1000)
      expect(avi.balance).to eq(1000)
    end
  end
end

