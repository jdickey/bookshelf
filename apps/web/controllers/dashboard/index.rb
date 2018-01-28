# frozen_string_literal: true

module Web
  module Controllers
    module Dashboard
      class Index
        include Web::Action
        expose :title

        def call(_params)
          @title = 'Dashboard'
        end
      end
    end
  end
end
