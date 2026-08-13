class EmpregadospaginacoesController < ApplicationController

  def index
    @empregados = Empregado.search(params[:search]).page(params[:page]).per(params[:per_page] || 5)
  end



end
