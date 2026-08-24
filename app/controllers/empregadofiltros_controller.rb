class EmpregadofiltrosController < ApplicationController

  def index
    @empregados = Empregado.includes(:department, :country)


    # if params[:search].present?
    #   # @empregados = @empregados.where(email: params[:search])
    # end
    # if params[:start_date].present?
    #   @empregados = @empregados.where(
    #     "birthdate >= ?",
    #     Date.iso8601(params[:start_date])
    #   )
    # end

    # end_date = Date.iso8601(params[:end_date].presence || Date.current.to_s)
    # @empregados = @empregados.where("birthdate <= ?", end_date)

    @empregados = @empregados.order("departments.name DESC", "countries.name DESC")
  end



end
