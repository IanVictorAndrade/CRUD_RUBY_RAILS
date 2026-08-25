class Transfer < ApplicationRecord

  belongs_to :from_account, class_name: "Account"
  belongs_to :to_account, class_name: "Account"

  def deduct_from_account
    if from_account.balance < amount
      errors.add(:base, "Insufficient balance in From Account")
      raise ActiveRecord::Rollback
    end
  end

  def deduct_from_account_balance
    from_account.balance -= amount
    from_account.save
  end

  def add_to_account
    to_account.balance += amount
    to_account.save
  end


end
