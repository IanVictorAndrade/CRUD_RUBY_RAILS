class EmpregadoXlsService

  def initialize(empregados)
    @empregados = empregados
  end

  def empregado_data
    workbook = Spreadsheet::Workbook.new
    worksheet = workbook.create_worksheet(name: 'EmpregadoData')

    worksheet.row(0).concat ['First Name', 'Last Name', 'Salário', 'Notas']

    @empregados.each_with_index do |emp, index|
      worksheet.row(index + 1).push emp.firstname, emp.lastname, emp.salary, emp.notes
    end

    workbook
  end


end