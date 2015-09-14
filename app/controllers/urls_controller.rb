class UrlsController < ApplicationController
  require 'date'

  def new
  end

  def create
    if !params[:name_url_minify].length.between?(10, 2048)
      flash[:error] = "Les URL doivent être entre 10 et 2048 caractères."
      render :new 
      elsif !params[:name_url_minify].start_with?('http://') 
        flash[:error] = "Les URL doivent commencer par 'http://'"
        render :new 
    else
      bitly = Bitly.client
      u = bitly.shorten(params[:name_url_minify])
      rec = Url.create(name_url_minify: u.short_url, name_original_url: u.long_url)
      flash[:notice] = "Votre URL est prête!"
      redirect_to urls_admin_path(:rec_id => rec.id)
    end
  end
 
  
  
  def admin 
    @url = Url.find_by_id(params[:rec_id])
    @data=CountAccessUrl.get_data_grafic(params[:rec_id])
  end
  
  def click
    url= AccessUrl.create(url_id: params[:id])
    CountAccessUrl.count_access_url(params[:id], url.created_at.strftime("%Y-%d-%m"))
    redirect_to params[:s]
  end

end