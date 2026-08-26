require 'caracal'

class EmpregadoDocxService

  def initialize(empregados)
    @empregados = empregados
  end

  def empregado_data
    file_name = "#{Time.now.to_i}.docx"
    file_path = "#{Rails.root}/public/#{file_name}"
    doc = Caracal::Document.new(file_path)

    doc.table empregado_data_rows do
      border_color '666666'
      border_line :single
      border_size 4
      border_spacing 4
    end

    doc.save
    file_name

  end

  def empregado_data_rows
    [["First Name", "Last Name", "Salário", "Notas"]] +
      @empregados.map do |empregado|
        [empregado.firstname, empregado.lastname, empregado.salary, empregado.notes]
      end
  end



end