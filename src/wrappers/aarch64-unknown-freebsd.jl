# Autogenerated wrapper script for OpenJpeg_jll for aarch64-unknown-freebsd
export libopenjp2, opj_compress, opj_decompress, opj_dump

using LittleCMS_jll
using libpng_jll
using Libtiff_jll
JLLWrappers.@generate_wrapper_header("OpenJpeg")
JLLWrappers.@declare_library_product(libopenjp2, "libopenjp2.so.7")
JLLWrappers.@declare_executable_product(opj_compress)
JLLWrappers.@declare_executable_product(opj_decompress)
JLLWrappers.@declare_executable_product(opj_dump)
function __init__()
    JLLWrappers.@generate_init_header(LittleCMS_jll, libpng_jll, Libtiff_jll)
    JLLWrappers.@init_library_product(
        libopenjp2,
        "lib/libopenjp2.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        opj_compress,
        "bin/opj_compress",
    )

    JLLWrappers.@init_executable_product(
        opj_decompress,
        "bin/opj_decompress",
    )

    JLLWrappers.@init_executable_product(
        opj_dump,
        "bin/opj_dump",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
