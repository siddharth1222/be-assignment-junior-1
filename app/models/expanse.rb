# frozen_string_literal: true

class Expanse < ApplicationRecord
  scope :active, -> { where(status: false) }
  # Ex:- scope :active, -> {where(:active => true)}

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :paid_by, class_name: 'User', foreign_key: 'paid_by_id'
  belongs_to :user, class_name: 'User', foreign_key: 'created_by_id'
  has_many :expanse_payments

  def users(a)
    a.each do |usr|
      arr = usr.split('->')
      frnd = User.find_by(email: arr[1])
      # return raise 'invalid email id' if frnd.nil?
      next if paid_by_id == frnd.id

      ExpansePayment.create(user_id: frnd.id, expanse_id: id, paid_by_id: paid_by_id)
    end
    ExpansePayment.create(user_id: created_by_id, expanse_id: id, paid_by_id: paid_by_id) if paid_by_id != created_by_id
  end
end
