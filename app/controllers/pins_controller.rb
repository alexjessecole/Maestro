class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :favorites]

  require 'will_paginate/array'
 



def index
    @pins = Pin.order("created_at desc").page(params[:page]).per_page(6)
     respond_to do |format|
        format.html
        format.js
    end
 end

 def favorites
       @pins = Pin.order("created_at desc").page(params[:page]).per_page(6)
        @pins = Pin.all.sort_by{|pin|-pin.get_likes.size}.paginate(:page => params[:page], :per_page => 6)
    
     respond_to do |format|
        format.html
        format.js
    end
 end

  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end

def create
  @pin = Pin.new(pin_params)
  @pin.user_id = current_user.id
   if @pin.save
      redirect_to @pin, notice: 'Image was successfully uploaded.'
    
    else
      render action: 'new'
    end
end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end
    def upvote
  @pin = Pin.find(params[:id])
    @pin.liked_by current_user
    if @pin.vote_registered?
   redirect_to :back, notice: "Image added to favorites."
  else
   redirect_to :back, notice: "You have already marked this image as a favorite." 
 end
end

def downvote
  @pin = Pin.find(params[:id])
  @pin.disliked_by current_user
   if @pin.vote_registered?
   redirect_to :back, notice: "Thanks for voting!"
  else
   redirect_to :back, notice: "You may only vote once, either for or against." 
 end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end