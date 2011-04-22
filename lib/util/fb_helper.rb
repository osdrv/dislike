require 'mini_fb'

def get_fb_user_id_by_cookie(cookie)
  return nil if cookie.nil?
  res = /uid=(.+?)[&"$]/.match(cookie)
  res[1] if !res.nil?
end

def check_fb_user(cookie)
  fb_uid = get_fb_user_id_by_cookie(cookie)
  return false if fb_uid.nil?
  user = FBUser.find_by_fbid(fb_uid)
  user = load_user_data(cookie)
  return !user.nil?
end

def parse_fb_cookie(cookie)
  fb_sess_h = {}
  cookie.gsub('"', '').split('&').each do |el|
    (k, v) = el.split('=')
    fb_sess_h[k.to_sym] = v
  end
  fb_sess_h
end

def load_user_data(cookie)
  fb_sess_h = parse_fb_cookie(cookie)
  return nil if fb_sess_h[:uid].nil?
  user_data = MiniFB.get(fb_sess_h[:access_token], fb_sess_h[:uid])
  return nil if !user_data.any?
  user = FBUser.find_by_fbid(user_data[:id]) || FBUser.new
  user.update_attributes(
    :fbid => user_data[:id],
    :access_token => fb_sess_h[:access_token],
    :first_name => user_data[:first_name],
    :last_name => user_data[:last_name],
    :name => user_data[:name],
    :fblink => user_data[:link],
    :gender => user_data[:gender]
  )
  user
end
