class UrlsController < ApplicationController
  #urlhelper contains the url_exist? function that checks if the url works
  include UrlsHelper
  def new
    respond_to do |format|
      format.json {render :json=>Url.all}
    end
    if params.has_key?("addURLLink")
      addUrl(params[:addURLLink])
		end
  end
  
  private
  def addUrl(addLink)
    #this is the current size of the boxes
    side_size = 300
    crop_side_size = side_size-50 
    #get the current_user
    @user = current_user
    @url = Url.new
    @url = Url.new(params[:url])
	  @url.assign_attributes({ :link => addLink})
    duplicated = url_stored?(@url.link)
    valid = false
    if not duplicated
      #add http and check if it isn't one
      @url.save
      valid = url_exist?(@url.link)
    else 
      @url.destroy
      @url = duplicated
    end
    if duplicated or valid
      #makes a new temporary file called capture.png in the tmp folder
      file = Tempfile.new(["capture", '.png'], 'tmp',
                           :encoding => 'ascii-8bit')
      #this really does use the phantom gem now to take an image from the url, arguments are separated by commas
      Phantomjs.run("--ignore-ssl-errors=yes", "--ssl-protocol=any", "public/rasterize.js", @url.link, file.path, "1024px*768px")
      #saves the file into the img variable
      img = File.open(file.path)
      file.flush
      @url.image = img
      @url.save
      #store the box information into the box
      @box = @user.boxes.create(url_id: @url.id, isDynamic: false)
      @box.save
      #delete the capture.png file from the tmp folder
      File.delete(file.path)
      file.unlink

      #redirect back to the show page
      #redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      flash[:notice] = 'unable to reach url please check if you inputed the url correctly'
      redirect_to :controller => 'urls', :action => 'new'
    end
  end

end
