module ApplicationHelper
  def google_map_url
    api_key = ENV['GOOGLE_MAPS_API_KEY'] || 'AIzaSyB-t8XMvm6aOqxvFsrI8fd9hqiMz5hkzRY'
    zoom = 12
    place = 'Vulcan'
    city = 'Birmingham'
    state = 'AL'
    location = "#{place},#{city}+#{state}"
    "https://www.google.com/maps/embed/v1/place?key=#{api_key}&zoom=#{zoom}&q=#{location}"
  end
end
