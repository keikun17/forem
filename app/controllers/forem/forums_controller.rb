module Forem
  class ForumsController < Forem::ApplicationController
    before_filter :authenticate_forem_admin, :only => [:new, :create]
    
    def index
      @forums = Forem::Forum.all
    end

    def show
      @forum = Forem::Forum.find(params[:id])
    end
    
    def new
      @forum = Forem::Forum.new
    end
    
    def create
      @forum = Forem::Forum.new(params[:forum])
      if @forum.save
        flash[:notice] = t("forem.forum.created")
        redirect_to @forum
      else
        flash[:error] = t("forem.forum.not_created")
        render :action => "new"
      end
    end
  end
end