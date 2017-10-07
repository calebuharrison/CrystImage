require "lib_stb_image"
module CrystImage

  enum Channels
    Default   = LibSTBImage::Channels::Default
    Grey      = LibSTBImage::Channels::Grey
    GreyAlpha = LibSTBImage::Channels::GreyAlpha
    RGB       = LibSTBImage::Channels::RGB
    RGBAlpha  = LibSTBImage::Channels::RGBAlpha
  end

end