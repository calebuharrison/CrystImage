require "./channels"
module CrystImage
  struct Image

    @data               : Slice(UInt8)
    @filename           : String
    @width              : Int32
    @height             : Int32
    @number_of_channels : Int32
    @channels           : Channels

    def initialize(path : String, channels : Channels = Channels::Default)
      ptr = LibSTBImage.load(path, out width, out height, out number_of_channels, channels)
      @data = Slice(UInt8).new(ptr, width * height)
      @path = path
      @filename = filename
      @width = width
      @height = height
      @number_of_channels = number_of_channels
      @channels = channels
    end

    def data
      @data
    end

    def path : String
      @path
    end

    def filename : String
      @path.split("/").last
    end

    def width : Int32
      @width
    end

    def height : Int32
      @height
    end

    def number_of_channels : Int32
      @number_of_channels
    end

    def channels : Channels
      @channels
    end

    def release
      LibSTBImage.image_free(@data)
    end

    def to_unsafe
      @data.to_unsafe
    end

  end
end