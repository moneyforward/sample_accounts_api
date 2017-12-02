class Account < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :user

  self.data = [
    { id: 1, user_id: 1, name: 'A銀行', balance: 20000 },
    { id: 2, user_id: 2, name: 'Bカード', balance: 200 },
    { id: 3, user_id: 1, name: 'C信用金庫', balance: 120000 },
    { id: 4, user_id: 2, name: 'Dバンク', balance: 30000 },
    { id: 5, user_id: 1, name: 'E銀行', balance: 5000 },
    { id: 6, user_id: 3, name: 'Fカード', balance: 22000 },
    { id: 7, user_id: 4, name: 'G信用金庫', balance: 10000 },
    { id: 8, user_id: 4, name: 'Hバンク', balance: 3050 },
  ]
end
