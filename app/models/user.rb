# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :expanses,
  has_many :expanse_payments
  has_many :paids, class_name: "ExpansePayment", foreign_key: "paid_by_id"
  has_many :expanses, class_name: 'Expanse', foreign_key: 'created_by_id'

  def friends
    @send = UserFriend.where(sender_id: id).map(&:receiver)
    @recieve = UserFriend.where(receiver_id: id).map(&:sender)
    # @friends = @send.concat(@receiver)
    @recieve + @send
  end

  def add_frnd(frnd)
    @add = UserFriend.new(sender_id: id, receiver_id: frnd.id)
    @add.save
  end

  def is_friend(user)
    @find = UserFriend.where(sender_id: id,
                             receiver_id: user.id).or(UserFriend.where(sender_id: user.id,
                                                                       receiver_id: id))
    !@find.empty?
  end

  def expanse_data
    # plus = []
    minus = []
    # plus = expanses.active.map{|a| a.expanse_payments.map(&:for_user)}
    plus = paids.active.map{|a| a.for_user('pos')}

    minus = expanse_payments.active.map{|a| a.for_user('neg')}
    { you_owe: minus, you_owed: plus }
  end

  def frnd_options
    friends.map { |c| ["#{c.name}->#{c.email}"] }
  end

  def self.query_search(query)
    return if query.nil?

    where('lower(users.name) like ? or lower(users.email) like ?', "%#{query.to_s.downcase}%",
          "%#{query.to_s.downcase}%")
  end

  def self.search_res(arr)
    arr1 = []
    arr.each do |a|
      b = a.slice(:id, :name, :email)
      arr1 << b
    end
    # self.slice(:name, :email, :id)
    arr1
  end
end
