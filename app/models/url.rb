class Url < ApplicationRecord
  validates_presence_of :long_url, :short_url
  validates :long_url, format: URI::regexp(%w[http https])
  validates_length_of :long_url, within: 3..255
  validates_length_of :short_url, within: 3..255

  def make_short_url
    rand(36**8).to_s(36)
  end
end