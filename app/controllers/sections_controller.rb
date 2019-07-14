class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Heyo ya section is all made and stuff"
      redirect_to(sections_path)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      redirect_to(new_section_path)
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_params)

    if @section.save
      flash[:notice] = "Mmm that's some good updates there"
      redirect_to(section_path)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Bye bye section"
    redirect_to(sections_path)
  end

  private
  
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
