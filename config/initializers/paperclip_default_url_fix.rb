Paperclip.interpolates :category_name do |attachment, style|
  attachment.instance.subcategory ? attachment.instance.subcategory.default_image : attachment.instance.category.default_image
end