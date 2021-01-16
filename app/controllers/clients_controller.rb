class ClientsController < ApplicationController

  def show
    @client = Client.where('name == ?', params[:name])
    if @client.blank?
      alert = {"message"=>"Client not found"}
      render json: alert
    else
      render json: @client
    end
    
  end

end
