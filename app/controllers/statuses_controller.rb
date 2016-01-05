class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    user = User.find 1
    @status.creator = user  # TODO update after authenticate

    if @status.save
      flash[:notice] = "Status created!"
      redirect_to user_path(user.username)
    else
      render :new
    end
  end

  private

  def status_params
    params.require(:status).permit(:body)
  end
end