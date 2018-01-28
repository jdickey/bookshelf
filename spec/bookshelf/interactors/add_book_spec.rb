# frozen_string_literal: true

require 'spec_helper'

describe AddBook do
  let(:book_author) { 'James Baldwin' }
  let(:book_title) { 'The Fire Next Time' }
  let(:interactor) { AddBook.new }
  let(:attributes) do
    { author: book_author, title: book_title }
  end

  describe 'good input' do
    let(:result) { interactor.call(attributes) }

    it 'succeeds' do
      expect(result.success?).must_equal true
    end

    describe 'creates a Book with correct' do
      let(:book) { result.book }

      it 'title' do
        expect(book.title).must_equal book_title
      end

      it 'author' do
        expect(book.author).must_equal book_author
      end
    end # describe 'creates a Book with correct'

    it 'persists the book' do
      expect(result.book.id).wont_be :nil?
    end

    describe 'persistence' do
      let(:repo) do
        ret = Object.new
        def ret.create(attribs_in)
          @attribs = OpenStruct.new({ id: 1 }.merge(attribs_in))
        end
        ret.class.class_eval { attr_reader :attribs }
        ret
      end

      it 'persists the book' do
        AddBook.new(repository: repo).call(attributes)
        expect(repo.attribs.id).must_equal 1
      end
    end # describe 'persistence'

    describe 'sending email' do
      it 'sends :deliver to the mailer' do
        mailer = Minitest::Mock.new
        mailer.expect :deliver, :return_value
        AddBook.new(mailer: mailer).call(attributes)
        mailer.verify
      end
    end # describe 'sending email'
  end # describe 'good input'
end
