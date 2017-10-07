require "./crystimage/**"
require "lib_stb_image"

module CrystImage

  @@configuring : Bool = false

  def self.on_load(&block)
    @@configuring = true
    yield self
    @@configuring = false
  end

  def self.flip_vertically=(b : Bool)
    raise "Must be configuring to configure!" unless @@configuring
    LibSTBImage.set_flip_vertically_on_load(b.hash)
  end

  def self.unpremultiply=(b : Bool)
    raise "Must be configuring to configure!" unless @@configuring
    LibSTBImage.set_unpremultiply_on_load(b.hash)
  end

  def self.open(filename : String, channels : Channels = Channels::Default, &block)
    image = Image.new(filename, channels)
    yield image
    image.release
  end

end