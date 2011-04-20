def get_fb_user_id_by_cookie(cookie)
  return nil if cookie.nil?
  res = /uid=(.+?)[&"$]/.match(cookie)
  res[1] if !res.nil?
end