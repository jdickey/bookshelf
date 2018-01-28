# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Web::Views::Books::New do
  let(:error_messages) { ['Title must be filled', 'Author must be filled'] }
  let(:params) do
    OpenStruct.new(valid?: false, error_messages: error_messages)
  end
  let(:exposures) { Hash[params: params] }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/new.html.erb')
  end
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('Author must be filled')
  end
end
