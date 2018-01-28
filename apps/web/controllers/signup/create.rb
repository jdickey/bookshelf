
require 'awesome_print'

module Web
  module Controllers
    module Signup
      class Create
        include Web::Action

        params do
          required(:email).filled
          required(:password).filled

          required(:address).schema do
            required(:country).filled
          end
        end

        def call(_params); end
      end
    end
  end
end
