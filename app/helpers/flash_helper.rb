module FlashHelper
  ALERT_MAP = {
      notice: 'info',
      error: 'danger',
      alert: 'secondary',
  }

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[:alert], class: "flash #{type}"
    end
  end

  def alert_map(key)
    ALERT_MAP[key.to_sym] || key
  end

end
