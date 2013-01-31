module ApplicationHelper
  def base_url
    ENV['CUSTOM_URL']||ENV['URL']
  end
end
