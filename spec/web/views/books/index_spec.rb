# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/index.html.erb')
  end
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no books' do
    it 'shows a placeholder message' do
      expected = '<p class="placeholder">There are no books yet.</p>'
      rendered.must_include(expected)
    end
  end

  describe 'when there are books' do
    let(:book1) { Book.new(title: 'Refactoring', author: 'Martin Fowler') }
    let(:book2) do
      Book.new(title: 'Domain Driven Design', author: 'Eric Evans')
    end
    let(:exposures) { Hash[books: [book1, book2]] }

    it 'lists them all' do
      rendered.scan(/class="book"/).count.must_equal 2
      rendered.must_include('Refactoring')
      rendered.must_include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      unexpected = '<p class="placeholder">There are no books yet.</p>'
      rendered.wont_include(unexpected)
    end
  end
end
