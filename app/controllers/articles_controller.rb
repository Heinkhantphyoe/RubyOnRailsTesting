class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "hein", password: "1111", except: [:index, :show]


  def index
    @articles = Article.search(params[:search])
    # @articles = Article.order(:title).page params[:page]
    # @articles = Article.paginate(page: params[:page], per_page: 1)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

   def edit
    @article = Article.find(params[:id])
   end

   def update
    @article = Article.find(params[:id])
       if @article.update(article_params)
         
         redirect_to @article
       else
         
         render 'edit'
       end
   end

    def destroy
      @article = Article.find(params[:id])
      if @article.destroy
        redirect_to root_path
      end
    end
    
   
   

  private
    def article_params
      params.require(:article).permit(:title, :body ,:profile_image, :status)
    end
end
