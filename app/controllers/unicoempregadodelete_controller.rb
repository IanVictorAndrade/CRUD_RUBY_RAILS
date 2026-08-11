class UnicoempregadodeleteController < ApplicationController

  def index
    @empregados = Empregado.all
  end

  def destroy_selected
    empregado = Empregado.find(params[:empregado_id])
    empregado.destroy!

    redirect_to unicoempregadodelete_index_path, notice: "Funcionário excluído com sucesso."
    rescue ActiveRecord::RecordNotFound
    redirect_to unicoempregadodelete_index_path, alert: "Selecione um funcionário para excluir."
  end


end
