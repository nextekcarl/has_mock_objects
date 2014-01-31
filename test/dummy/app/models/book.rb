class Book < ActiveRecord::Base
  has_mock_objects

  attr_accessible :title

  has_many_mocks :chapters, 5, title: :words, content: :paragraphs, written: :recent_date
  has_one_mock :author, name: :name, email: :email, born: :historical_date
end
