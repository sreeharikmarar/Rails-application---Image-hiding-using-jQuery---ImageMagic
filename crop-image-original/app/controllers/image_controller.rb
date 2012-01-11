class ImageController < ApplicationController


  def index

    @files = Asset.all
    @file = Asset.new

    respond_to do |format|
      format.html {}
      format.js { }
    end

  end

  def show

    @file = Asset.find(params[:id])

    respond_to do |format|
      format.html {}
      format.js { }
    end

  end

  def create

    @file = Asset.new(params[:asset])
    @file = Asset.new({:document=>params[:document]})
    @file.valid?
    unless params[:document]
      @file.errors.add(:document, "Invalid Image format, Unable to support images greater than 1MB")
    end

    @file.errors.add(:document,@file.errors[:document_file_name]) if @file.errors[:document_file_name].any?
    @file.errors.add(:document,@file.errors[:document_file_size]) if @file.errors[:document_file_size].any?
    @file.errors.add(:document,@file.errors[:document_file_type]) if @file.errors[:document_file_type].any?

    if @file.errors.empty?

      @file.save

      redirect_to images_path
   
    else

     

      flash[:notice] = "Upload a file"
      redirect_to images_path
 
    end

  end

  def destroy

    @file = Asset.find_by_id(params[:id])

    if @file
      @file.destroy
    end

    redirect_to images_path

  end
def save
  @fg = params["params"]
  

 @file = Asset.last
 @root= Rails.root.to_s
 @img = @file.document.to_s
 @img_path = @root + @img


@color = params["color"]



  @fg.each do |lis|
    
    val = lis[1]
 
     cord = val[0].to_s + 'x' + val[1].to_s + '+' + val[2].to_s + '+' + val[3].to_s
     if @color == '1'
          system "convert #{@img_path} -region #{cord} -fill black -colorize 100% #{@img_path}"
     elsif @color == '2'
          system "convert #{@img_path} -region #{cord} -fill white -colorize 100% #{@img_path}"
     elsif @color == '3'
          system "convert #{@img_path} -region #{cord} -fill blue -colorize 100% #{@img_path}"
     elsif @color == '4'
          system "convert #{@img_path} -region #{cord} -fill red -colorize 100% #{@img_path}"
     else
          system "convert #{@img_path} -region #{cord} -fill green -colorize 100% #{@img_path}"
     end
  end

end

end
