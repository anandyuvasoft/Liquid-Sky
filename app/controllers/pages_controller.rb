class PagesController < ApplicationController
  
  require 'open-uri'

  def index
    url = "https://rc-universe.in/products/full-function-r-c-vehicle?variant=32252534860"
    doc = Nokogiri::HTML(open(url))
    @page_title = doc.at_css('title').text.strip
    @page_link = url
    @page_description = "This is a sample feed containing the required and recommended attributes for a single product"
    @product_title = doc.at_css('h3#page-product-title').text.strip
    @product_description = doc.at_css('div.description').text.strip
    @product_price = doc.at_css('span.save_price').text.strip
    @product_image = doc.at_css('div.product-image-thumb a img').values.first
    respond_to do |format|
      format.rss { render :layout => false }
    end    
  end

end
