# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Web::Views::Books::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/create.html.erb')
  end
  let(:view)      { Web::Views::Books::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
