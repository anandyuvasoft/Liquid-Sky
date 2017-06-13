xml.instruct! :xml, :version => "1.0" 
xml.rss 'xmlns:g' => "http://base.google.com/ns/1.0" , :version => "2.0" do
  xml.channel do
    xml.title @page_title
    xml.link @page_link
    xml.description @page_description

    xml.item do
      xml.g :title, @product_title
      xml.g :description, @product_description
      xml.g :link, @page_link
      xml.g :image_link, @product_image
      xml.g :price, @product_price
      xml.g :condition, 'used'
      xml.g :availability, "in stock"
    end

  end
end


