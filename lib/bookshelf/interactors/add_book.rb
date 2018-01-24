
require 'hanami/interactor'

# First interactor from tutorial; adding a new Book to the collection.
class AddBook
  include Hanami::Interactor

  expose :book

  def initialize(repository: BookRepository.new)
    @repository = repository
  end

  def call(book_attributes)
    @book = @repository.create(book_attributes)
  end
end
