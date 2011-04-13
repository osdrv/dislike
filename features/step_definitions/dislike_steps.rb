# encoding: utf-8

Допустим /имеется идентификатор ползователя "(.+?)" и адрес страницы "(.+?)"/ do |fb_uid, url|
  @fb_uid = fb_uid
  @url = url
end

Если /я спрошу, голосовал ли пользователь за эту страницу/ do
  @res = Dislike.user_voted?(@fb_uid, @url)
end

То /вернется отрицательный ответ/ do
  @res.should be false
end