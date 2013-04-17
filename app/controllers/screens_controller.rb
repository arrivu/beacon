class ScreensController < ApplicationController
  include ScreensHelper
  def home
    @courses = Course.all(:conditions => {:ispopular => 1},:limit => 6)
    @topics=Topic.all(:limit => 6)
    @topics = @topics.sort_by {|x| x.name.length}
  end

  def about
  end

  def faq
  end

  def privacy
  end

  def terms
  end

  def construction
  end 

end
