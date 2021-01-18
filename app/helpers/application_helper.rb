module ApplicationHelper
  # ページタイトル作成
  MAIN_TITLE = "Photographer".freeze
  def full_title(page_title = '')
    if page_title.blank?
      MAIN_TITLE
    else
      "#{page_title} - #{MAIN_TITLE}"
    end
  end
end
