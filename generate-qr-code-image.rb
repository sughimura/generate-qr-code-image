require 'rqrcode'
require 'fileutils'

input_file_name = 'sample.txt'
File.open("./input/#{input_file_name}"){|f|
  f.each_line{|line|
    qrcode = RQRCode::QRCode.new(line.chomp)

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 500
    )

    FileUtils.mkdir_p("output/#{input_file_name}")
    IO.binwrite("./output/#{input_file_name}/#{$.}.png", png.to_s)
  }
}
