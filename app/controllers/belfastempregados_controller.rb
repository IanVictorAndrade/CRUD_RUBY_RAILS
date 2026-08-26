class BelfastempregadosController < ApplicationController

  def index
    @empregados = Belfastempregado.all
  end

  def export_as
    @empregados = Belfastempregado.all
    if params[:export_type] == 'pdf'
      export_as_pdf
    elsif params[:export_type] == 'csv'
      export_as_csv
    elsif params[:export_type] == 'txt'
      export_as_txt
    elsif params[:export_type] == 'xls'
      export_as_xls
    elsif params[:export_type] == 'docx'
      export_as_docx
    else
      redirect_to root_path
    end
  end

  def export_as_pdf
    respond_to do |f|
      f.pdf do
        empregados_pdf = EmpregadoPdfService.new(@empregados)
        send_data empregados_pdf.render, filename: "empregados.pdf", type: "application/pdf", disposition: "attachment"
      end
    end
  end

  def export_as_csv
    respond_to do |f|
      f.html
      f.csv do
        filename = ['empregados', Date.today].join(' ')
        send_data Belfastempregado.to_csv(@empregados), filename:, content_type: "text/csv"
      end
    end
  end

  def export_as_txt
    txt_path = EmpregadoTxtService.new(@empregados).empregado_data
    send_file("#{Rails.root}/public/#{txt_path}", filename: 'empregados.txt')
  end

  def export_as_xls
    empbook = EmpregadoXlsService.new(@empregados).empregado_data
    respond_to do |f|
      f.xls {
        tempfile = Tempfile.new(['empregados', '.xls'])
        empbook.write(tempfile.path)
        send_file(tempfile.path, filename: 'empregados.xls', type: "application/vnd.ms-excel", disposition: 'attachment')
      }
    end
  end

  def export_as_docx
    docx_path = EmpregadoDocxService.new(@empregados).empregado_data
    send_file("#{Rails.root}/public/#{docx_path}", filename: 'empregados.docx', disposition: 'attachment')
  end

end
