Paperclip.interpolates :category_name do |attachment, style|
  attachment.instance.subcategory ? attachment.instance.subcategory.name : attachment.instance.category.name
end