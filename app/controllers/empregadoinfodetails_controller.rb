class EmpregadoinfodetailsController < ApplicationController

  def index
    @empregados = Empregadoinfo.all
  end

  def new
    @empregado = Empregadoinfo.new
  end

  def create
    @empregado = Empregadoinfo.new(empregado_params)
    if @empregado.save
      folder_name = "#{@empregado.id}_#{@empregado.lastname}"
      folder_path = Rails.public_path.join('empregado_files', folder_name)
      FileUtils.mkdir_p(folder_path)

      upload_file(params[:cv], folder_path, "#{folder_name}_cv")
      upload_file(params[:photo], folder_path, "#{folder_name}_photo")

      certificate_path = Rails.public_path.join('empregado_files', folder_name, 'certificados')
      FileUtils.mkdir_p(certificate_path) unless File.directory?(certificate_path)

      params[:empregado][:empregadocertificados_attributes].each_with_index do |certificado, index|
        upload_file(certificado[:certi], certificate_path, "certificado_#{index + 1}")
      end

      @empregado.update(certificado_params)
      redirect_to empregadoinfodetails_path

    end
  end

  def show
    @empregado = Empregadoinfo.find_by id: params[:id]

    if @empregado.present?
      @folder_name = "#{@empregado.id}_#{@empregado.lastname}"
      folder_path = Rails.public_path.join('empregado_files', @folder_name)
      file_list = Dir["#{folder_path.to_s}/*"]

      cv_file_name = file_list.find { |file| file.include?('cv') }.split("/").last
      photo_file_name = file_list.find { |file| file.include?('photo') }.split("/").last
      @cv_file_path = "empregado_files/#{@folder_name}/#{cv_file_name}"
      @my_pic_file_path = "empregado_files/#{@folder_name}/#{photo_file_name}"

      certi_folder_path = Rails.public_path.join('empregado_files', @folder_name, 'certificados')
      certi_files = Dir["#{certi_folder_path.to_s}/*"]
      @certificates = certi_files.map { | certi | certi[certi.index("empregado_files")..(certi.length)] }

    end
  end

  def download_file
    send_file("#{Rails.root}/public/#{params[:download_path]}")
  end

  def upload_file(uploaded_file, folder_path, new_fname)
    return if uploaded_file.blank?

    file_name = uploaded_file.original_filename
    file_extension = file_name.split(".").last
    new_file_name = "#{new_fname}.#{file_extension}"

    File.open(File.join(folder_path, new_file_name), 'wb') do |file|
      file.write(uploaded_file.read)
    end

  end

  private

  def empregado_params
    params.require(:empregadoinfo).permit(:firstname, :lastname, :pan_card)
  end

  def certificado_params
    params.require(:empregado).permit(empregadocertificados_attributes: [:certi])
  end

end
