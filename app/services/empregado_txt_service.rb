class EmpregadoTxtService


  def initialize(empregados)
    @empregados = empregados
  end

  def empregado_data
    txt_content = "First Name\tLast Name\tSalário\tNotas\n"
    @empregados.each do |empregado|
      txt_content += "#{empregado.firstname}\t#{empregado.lastname}\t#{empregado.salary}\t#{empregado.notes}\n"
    end

    file_name = "empregados_#{Time.now.to_i}.txt"
    file_path = "#{Rails.root}/public/#{file_name}"

    File.open(file_path, 'w') do |file|
      file.write(txt_content)
    end

    file_name
  end








end