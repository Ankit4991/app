class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "ankit", password: "secret", except: [:index, :show]

	before_action :find_user, only: [:show,:edit,:update,:destroy]
	
	def index
    	@articles = Article.all
    end
	
	def show
	    
  	end
	
	def new
		@article = Article.new
	end
  	
  	def edit
	end
  	
  	def create
  		@article = Article.new(article_params)
   		if @article.save
	    	redirect_to @article
	   	else
	    	render 'new'
	   	end
  	end
  	
  	def update
	    if @article.update(article_params)
	      redirect_to @article
	    else
	      render 'edit'
	    end
  	end
 
	def destroy
		@article.destroy
		redirect_to articles_path
	end

	def find_user
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end