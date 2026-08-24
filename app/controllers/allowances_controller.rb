class AllowancesController < ApplicationController

  def radio_index
    @allowance_types = Allowancetype.all
    @empregado_salario = Empregadosalario.new
  end

  def radio_create
    @empregado_salario = Empregadosalario.new(employee_salary_params)

    if @empregado_salario.save
      @empregado_salario.empregadoallowances.create!(
        allowancetype_id: params[:allowance_type_id]
      )
      redirect_to radio_index_path, notice: "Empregado Salario criado com sucesso."
    else
      @allowance_types = Allowancetype.all
      render :radio_index, status: :unprocessable_content
    end

  end

  def check_box_index
    @allowance_types = Allowancetype.all
    @empregado_salario = Empregadosalario.new
  end

  def check_box_create
    #Fail
    @empregado_salario = Empregadosalario.new(employee_salary_params)
    if @empregado_salario.save
      @empregado_salario.allowancetypes << Allowancetype.where(id: params[:allowancetype_ids])
      redirect_to check_box_index_path, notice: 'Employee Salary was successfully created.'
    else
      render :check_box_index
    end

  end

  def list_box_index

  end

  def list_box_create

  end


  private

  def employee_salary_params
    params.require(:empregadosalario).permit(:salary, :netallowanceamount, :netsalary)
  end
end
