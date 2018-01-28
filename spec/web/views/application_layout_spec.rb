# frozen_string_literal: true

require 'spec_helper'

describe Web::Views::ApplicationLayout do
  let(:layout)   { Web::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/application.html.erb')
  end

  it 'contains application name' do
    rendered.must_include('Web')
  end
end
