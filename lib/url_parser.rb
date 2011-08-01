class UrlParser
  def initialize(url)
    @url = url
  end
  
  def hash
    @hash
  end
  
  def document
    @document
  end
  
  def url
    @url
  end
  
  def images
    @images
  end
  
  def title
    @title
  end
  
  def description
    @description
  end
  
  def parse_url
    @document = Nokogiri::HTML(open(@url))
    @title_tag = @document.css('title')
    @title = @title_tag.text
    
    @description_tag = @document.css("meta[name='description']").first
    @description = @description_tag['content']
    
    @images = @document.css("img")

    @params_hash = {}
    @images_hash = {}
    
    @params_hash[:title] = @title
    @params_hash[:description] = @description
    @params_hash[:images] = @images_hash
    
    @images.each_with_index do |img, i|
      @images_hash["image_#{i+1}_src"] = img['src'].to_s
      @images_hash["image_#{i+1}_title"] = img['alt'].to_s
    end

  end
end