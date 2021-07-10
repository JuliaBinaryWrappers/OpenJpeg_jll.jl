# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule OpenJpeg_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("OpenJpeg")
JLLWrappers.@generate_main_file("OpenJpeg", UUID("643b3616-a352-519d-856d-80112ee9badc"))
end  # module OpenJpeg_jll
