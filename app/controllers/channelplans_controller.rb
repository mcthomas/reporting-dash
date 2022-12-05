class ChannelplansController < ApplicationController
  
  def index
    set_ui_variables
    @channelplans = Channelplan.all
    @userreports = Userreport.all
  end

  def new
    @channelplan = Channelplan.new
  end

  def dashboard
    @channelplans = Channelplan.all
    @userreports = Userreport.all
  end

  def show
    @channelplan = Channelplan.find(params[:id])
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
  end

  def destroy
    @channelplan = Channelplan.find(params[:id])
    @channelplan.destroy
    redirect_to dashboard_path
  end

  def create
    @channelplan = Channelplan.new(channelplan_params)
    if @channelplan.save
      redirect_to channelplans_path
    else
      render 'new'
    end
  end

  private

  def channelplan_params
    params.require(:channelplan).permit(:channel, :name, :structure, :tone, :action)
  end

  private

  def set_ui_variables
    @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
    card = 'card hoverable'
    @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                     "#{card} purple", "#{card} indigo", "#{card} brown"]
  end

end
