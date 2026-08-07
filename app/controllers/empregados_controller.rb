class EmpregadosController < ApplicationController
  before_action :set_empregado, only: %i[show edit update delete_empregado destroy]

  def index
    @empregados = Empregado.all
  end

  def show
  end

  def edit
  end

  def update
    if @empregado.update(empregado_params)
      redirect_to empregados_path, notice: "Funcionário atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_empregado
  end

  def destroy
    @empregado.destroy

    redirect_to empregados_path, notice: "Funcionário excluído com sucesso."
  end

  def new
    @empregado = Empregado.new
  end

  def create
    @empregado = Empregado.new(empregado_params)
    if @empregado.save
      redirect_to empregados_path, notice: "Funcionário criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_empregado
    @empregado = Empregado.find(params[:id])
  end

  def empregado_params
    params.require(:empregado).permit(
      :firstname,
      :lastname,
      :haspassport,
      :salary,
      :birthdate,
      :hiredate,
      :gender,
      :notes,
      :email,
      :phone
    )
  end

end
