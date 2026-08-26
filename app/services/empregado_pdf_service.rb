class EmpregadoPdfService < Prawn::Document
  def initialize(empregados)
    super()
    @empregados = empregados
    empregado_table
  end

  def empregado_table
    table empregado_data_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def empregado_data_rows
    [["First Name", "Last Name", "Salary", "Notes"]] +
      @empregados.map do |emp|
        [emp.firstname, emp.lastname, emp.salary, emp.notes]
      end
  end

end
