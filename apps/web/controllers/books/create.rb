
module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      return report_unprocessable_entity unless params.valid?

      create_entity(params[:book])
      redirect_on_success
    end

    private

    def create_entity(book_params)
      @book = BookRepository.new.create(book_params)
    end

    def redirect_on_success
      redirect_to routes.books_path
    end

    def report_unprocessable_entity
      self.status = 422
    end
  end
end
