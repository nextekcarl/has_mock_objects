require 'test_helper'

class HasMockObjectsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, HasMockObjects
  end

  def test_a_books_mock_chapters_should_return_array
    book = Book.new
    assert_equal true, book.chapters.is_a?(Array)
  end

  def test_a_books_mock_bibliographies_should_return_array_with_at_least_4_objects
    book = Book.new
    assert_equal true, book.bibliographies.is_a?(Array)
    assert_equal true, book.bibliographies.count >= 4
  end

  def test_a_books_mock_bibliographies_should_return_array_with_at_most_5_objects
    book = Book.new
    assert_equal true, book.bibliographies.is_a?(Array)
    assert_equal true, book.bibliographies.count <= 5
  end

  def test_a_books_mock_chapters_should_count_should_vary_between_instances
    books = []
    10.times do
      books << Book.new
    end
    chapter_counts =[]
    books.each do |book|
      chapter_counts << book.chapters.count
    end
    assert_equal true, chapter_counts.uniq.size != 1
  end

  def test_a_books_mock_author_should_return_one_author_with_an_email
    book = Book.new
    assert_equal true, book.author.email.is_a?(String)
  end

  def test_a_books_mock_author_email_should_not_be_regenerated_after_first_call
    book = Book.new
    assert_equal true, book.author.email == book.author.email
  end
end
