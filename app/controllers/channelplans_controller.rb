class ChannelplansController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin, :only => [:new, :destroy]
  before_action :check_lead, :only => [:edit]
  
  def index
    set_ui_variables
    @channelplans = Channelplan.all
    @userreports = Userreport.all
    @eligibilitylists = Eligibilitylist.all
    @user = current_user.email
  end

  def new
    @channelplan = Channelplan.new
    @user = current_user.email
  end

  def dashboard
    @channelplans = Channelplan.all
    @userreports = Userreport.all
    @eligibilitylists = Eligibilitylist.all
    @users = User.all
  end

  def show
    @channelplan = Channelplan.find(params[:id])
    @user = current_user.email
  end

  def update
    @channelplan = Channelplan.find(params[:id])
    if @channelplan.update(channelplan_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def edit
    @channelplan = Channelplan.find(params[:id])
    @user = current_user.email
  end

  def destroy
    @channelplan = Channelplan.find(params[:id])
    @channelplan.destroy
    redirect_to dashboard_path
  end

  def create
    @channelplan = Channelplan.new(channelplan_params)
    if @channelplan.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  protected

  def check_admin
    redirect_to dashboard_path and return unless current_user.admin?
  end

  def check_lead
    redirect_to dashboard_path and return unless (current_user.admin? or current_user.lead?)
  end

  private

  def channelplan_params
    params.require(:channelplan).permit(:channel, :name, :structure, :tone, :action, :assign)
  end

  private

  def set_ui_variables
    @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
    card = 'card hoverable'
    @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                     "#{card} purple", "#{card} indigo", "#{card} brown"]
  end

end
