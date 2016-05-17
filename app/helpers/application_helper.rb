module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Winery Group'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def random_wine_image
      a = rand(1..8)
      if a == 1
        return asset_path "wine/1.jpg"
      elsif a == 2
        return asset_path "wine/2.jpg"
      elsif a == 3
        return asset_path "wine/3.jpg"
      elsif a == 4
        return asset_path "wine/4.jpg"
      elsif a == 5
        return asset_path"wine/5.jpg"
      elsif a == 6
        return asset_path"wine/6.jpg"
      elsif a == 7
        return asset_path "wine/7.jpg"
      else
        return asset_path "wine/8.jpg"
      end
  end
  def random_cali_image
      a = rand(5)
      if a == 0
        return asset_path "cali/1.jpg"
      elsif a == 1
        return asset_path "cali/2.jpg"
      elsif a == 2
        return asset_path "cali/3.jpg"
      elsif a == 3
        return asset_path "cali/4.jpg"
      elsif a == 4
        return asset_path "cali/5.jpg"
      else
        return asset_path "cali/6.jpg"
      end
  end
end
