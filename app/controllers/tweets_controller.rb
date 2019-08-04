class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(6).order("created_at DESC")
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to root_path
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
      redirect_to root_path
    end
  end

  def destroy 
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to root_path
  end

private
def tweet_params
  params.require(:tweet).permit(:text)
  end
end
