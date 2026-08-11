class BulkdeleteempregadosController < ApplicationController

  def index
    @empregados = Empregado.all
  end

  def bulk_delete
    if params[:empregado_id].present?
      Empregado.where(id: params[:empregado_id]).destroy_all
    end
    redirect_to bulkdeleteempregados_path, notice: "Funcionário(s) excluído(s) com sucesso."
  end

end
