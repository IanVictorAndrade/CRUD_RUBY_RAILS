class EmpregadosController < ApplicationController
  def index
    @empregados = Empregado.all
  end

  def show
    @empregado = Empregado.find(params[:id])
  end

  def edit
    @empregado = Empregado.find(params[:id])
  end
end
