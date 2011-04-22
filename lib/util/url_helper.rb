require 'digest/sha1'

def make_url_hash(url)
  sault = 'I am hashing: '
  Digest::SHA1.hexdigest(sault + url.to_s)
end
