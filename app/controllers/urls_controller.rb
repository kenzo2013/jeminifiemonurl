class UrlsController < ApplicationController


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
   # date_start = Time.now - 7.days
   # date_end = Time.now
  #  rec = AccessUrl.group('date(created_at)')
                # .select('date(created_at) as date, count(*) as count')
                # .where(["created_at > ? and url_id = ?", Time.now - 7.days], @url.id)
             
  end
  
  def click
    AccessUrl.create(url_id: params[:id])
    redirect_to params[:s]
  end
  
  

end