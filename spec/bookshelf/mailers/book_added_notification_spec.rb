require_relative '../../spec_helper'

describe Mailers::BookAddedNotification do
  let(:subject) { Mailers::BookAddedNotification }

  before { Hanami::Mailer.deliveries.clear }

  describe 'has correct' do
    it '"from" email address' do
      expect(subject.from).must_equal 'no-reply@example.com'
    end

    it '"to" email address' do
      expect(subject.to).must_equal 'admin@example.com'
    end

    it 'subject' do
      expect(subject.subject).must_equal 'Book added!'
    end
  end # describe 'has correct'

  it 'delivers email' do
    old_length = Hanami::Mailer.deliveries.length
    _ = subject.deliver
    expect(Hanami::Mailer.deliveries.length).must_equal(old_length + 1)
  end
end
