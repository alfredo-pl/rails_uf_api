class UfController < ApplicationController

    def show
        fecha= params[:date]
        #@uf atrae el parametro
        url = 'https://mindicador.cl/api/uf/'+params[:date]
        response = HTTParty.get(url)
      
        alerta = ''
        if response['serie'].nil?
          alerta  = {'message'=>'Date is not valid'}
          render json: alerta      
        elsif response['serie'].empty?
          alerta  = {'message'=>'The uf value has not been calculated for this day'}
          render json: alerta 
        else
          #@uf se instancia
          @client = Client.new(name: 'Juan', query: fecha)
          
          @client.save
          alerta =response['serie']
          render json: alerta
        end
      end

end
