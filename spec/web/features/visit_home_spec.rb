# frozen_string_literal: true

require 'features_helper'

describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page.body).must_include('Bookshelf')
  end
end
