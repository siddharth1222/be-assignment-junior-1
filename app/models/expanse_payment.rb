# frozen_string_literal: true

class ExpansePayment < ApplicationRecord
  scope :active, -> { where(status: false) }

  belongs_to :user
  belongs_to :paid_by, class_name: "User", foreign_key: "paid_by_id"
  belongs_to :expanse

  # def for_user
  #   # hash = as_json.except('user_id', 'expanse_id', 'user_id', 'session_id')
  #   # total_person = expanse.expanse_payments.count + 1
  #   a = {}
  #   a[:user] = user
  #   a[:payment] = net_pay
  #   a[:expnase_id] = expanse_id
  #   a
  # end

  def for_user(condition)
    a = {}
    # total_person = expanse.expanse_payments.count + 1
    if condition=='pos'
    a[:user] = user
    else
    a[:user] = expanse.paid_by
    end
    a[:payment] = net_pay
    a[:expnase_id] = expanse_id
    a
  end

  def net_pay
    total_person = expanse.expanse_payments.count + 1
    expanse.amount / total_person
  end
end
