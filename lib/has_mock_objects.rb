require 'ostruct'
require 'faker'

module HasMockObjects
  extend ActiveSupport::Concern

  def has_mock_objects
    unless included_modules.include? LocalInstanceMethods
      extend ClassMethods
      include LocalInstanceMethods
    end
  end

  module LocalInstanceMethods
    FAKERSHORTCUTS = {
      word: lambda { Faker::Lorem.word },
      words: lambda { Faker::Lorem.words.join(' ') },
      sentence: lambda { Faker::Lorem.sentence },
      sentences: lambda { Faker::Lorem.sentences.join(' ') },
      paragraph: lambda { Faker::Lorem.paragraph },
      paragraphs: lambda { Faker::Lorem.paragraphs.join(' ') },
      name: lambda { Faker::Name.name },
      first_name: lambda { Faker::Name.first_name },
      last_name: lambda { Faker::Name.last_name },
      phone_number: lambda { Faker::PhoneNumber.phone_number },
      email: lambda { Faker::Internet.email },
      credit_card_number: lambda { Faker::Business.credit_card_number },
      credit_card_type: lambda { Faker::Business.credit_card_type }
    }

    def mock_attributes(attributes)
      mock = OpenStruct.new
      attributes.each do |attribute, type|
        mock.send( attribute.to_s + '=', FAKERSHORTCUTS[type].call )
      end
      return mock
    end

    def mock_objects
      @mock_objects ||= {}
    end
  end

  module ClassMethods
    include HasMockObjects::LocalInstanceMethods

    def has_many_mocks(obj, number, *attrs)
      attributes = attrs.extract_options!
      send :define_method, obj do
        mock_objects[obj] ||= (
          mocks = []
          rand(number).times do
            mocks << mock_attributes(attributes)
          end
          mocks
        )
        @mock_objects[obj]
      end
    end

    def has_one_mock(obj, *attrs)
      attributes = attrs.extract_options!
      send :define_method, obj do
        mock_objects[obj] ||= mock_attributes(attributes)
      end
    end
  end
end

ActiveRecord::Base.send :extend, HasMockObjects