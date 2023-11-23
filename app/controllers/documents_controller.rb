class DocumentsController < ApplicationController
  before_action :set_condo, only: [:index]

  def index
    @documents = @condo.documents
  end

  def new
    @document = Document.new
    @condos_for_select = condos_for_select
    @selected_condo_id = Condo.first.id
    render 'new'
  end

  def create
    if current_user.admin? || current_user.manage?
      @document = Document.new(document_params)
      @condos_for_select = condos_for_select

      if @document.save
        redirect_to root_path, notice: '書類が正常にアップロードされました。'
      else
        render :new
      end
    end
  end

  private

  def set_condo
    @condo = Condo.find(params[:condo_id])
  end

  def document_params
    params.require(:document).permit(:title, :category_id, :file, :condo_id)
  end

  def condos_for_select
    Condo.all.map { |condo| [condo.condo_name, condo.id] }
  end
end
