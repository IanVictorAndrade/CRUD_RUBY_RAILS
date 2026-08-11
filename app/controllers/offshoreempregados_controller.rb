class OffshoreempregadosController < ApplicationController

  def new
    @offshoreempregado = Offshoreempregado.new
  end

  def create
    @offshoreempregado = Offshoreempregado.new(offshoreempregado_params)
    if @offshoreempregado.save
      redirect_to new_offshoreempregados_path, notice: 'Offshore Empregado was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def offshoreempregado_params
    params.require(:offshoreempregado).permit(:firstname, :lastname, :country_id, :state_id, :city_id)
  end
end
