require_relative '../../../spec_helper'

describe Web::Controllers::Books::New do
  let(:action) { Web::Controllers::Books::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
