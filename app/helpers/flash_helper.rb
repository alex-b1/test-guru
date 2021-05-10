module FlashHelper
  def flash_message(type)
    if flash[type]
      content_tag :p, flash[:alert], class: "flash #{type}"
    end
  end
end
