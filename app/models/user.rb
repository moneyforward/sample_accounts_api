class User < ActiveHash::Base
  include ActiveHash::Associations
  has_many :accounts

  self.data = [
    { id: 1, name: 'Alice', account_ids: [1, 3, 5] },
    { id: 2, name: 'Bob', account_ids: [2, 4] },
    { id: 3, name: 'Carol', account_ids: [6] },
    { id: 4, name: 'Dave', account_ids: [7, 8] },
  ]
end
