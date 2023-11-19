class DocumentsController < ApplicationController
  before_action :set_condo

  def index
    @documents = @condo.documents
  end

  def new
    @document = @condo.documents.build
  end

  def create
    @document = @condo.documents.build(document_params)
    @document.user = current_user # ここでuser_idを設定
  
    if @document.save
      redirect_to @condo, notice: '書類が正常にアップロードされました。'
    else
      render :new
    end
  end
  
  
  

  private

  def set_condo
    @condo = Condo.find(params[:condo_id])
  end

  def document_params
    params.require(:document).permit(:title, :category_id, :file)
  end
end
