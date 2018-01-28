# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Web::Views::Signup::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template_path) { 'apps/web/templates/signup/create.html.erb' }
  let(:template)  { Hanami::View::Template.new(template_path) }
  let(:view)      { Web::Views::Signup::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
