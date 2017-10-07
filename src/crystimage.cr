require "./crystimage/**"
require "lib_stb_image"

module CrystImage

  def self.open(filename : String, channels : Channels = Channels::Default, &block)
    image = Image.new(filename, channels)
    yield image
    image.release
  end

end