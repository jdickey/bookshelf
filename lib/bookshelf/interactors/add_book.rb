
require 'hanami/interactor'

# First interactor from tutorial; adding a new Book to the collection.
class AddBook
  include Hanami::Interactor

  expose :book

  def initialize
    # set up the object
  end

  def call(book_attributes)
    @book = BookRepository.new.create(book_attributes)
  end
end
