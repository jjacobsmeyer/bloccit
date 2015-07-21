class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
    @questions = Question.new
  end

  def create
    @questions = Question.new(params.require(:question).permit(:title, :body, :resovled))
    if @questions.save
      flash[:notice] = "Question was saved."
      redirect_to @questions
    else
      flash[:error] = "there was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
  @question = Question.find(params[:id])
  end

  def update
  
    @questions = Question.find(params[:id])
    if @questions.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Question was updated."
      redirect_to @questions
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
  end
end
