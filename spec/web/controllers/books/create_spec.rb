
require_relative '../../../spec_helper'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  it 'creates a new book' do
    action.call(params)
    book = repository.last

    expect(book.id).wont_be_nil
    expect(book.title).must_equal params.dig(:book, :title)
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)

    expect(response[0]).must_equal 302
    expect(response[1]['Location']).must_equal '/books'
  end
end
