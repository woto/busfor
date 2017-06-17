module SearchableByNameConcern
  extend ActiveSupport::Concern
  PER_PAGE = 10

  def search
    model = params[:controller].classify.constantize
    q = model.ransack(name_cont: params[:q])
    @result = q.result.order(:name).page(params[:page]).per(PER_PAGE)
    render(json: @result, root: false)
  end
end
