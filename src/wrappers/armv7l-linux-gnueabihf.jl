# Autogenerated wrapper script for OpenJpeg_jll for armv7l-linux-gnueabihf
export opj_decompress, libopenjp2, opj_compress, opj_dump

using LittleCMS_jll
using libpng_jll
using Libtiff_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `opj_decompress`
const opj_decompress_splitpath = ["bin", "opj_decompress"]

# This will be filled out by __init__() for all products, as it must be done at runtime
opj_decompress_path = ""

# opj_decompress-specific global declaration
function opj_decompress(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(opj_decompress_path)
    end
end


# Relative path to `libopenjp2`
const libopenjp2_splitpath = ["lib", "libopenjp2.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libopenjp2_path = ""

# libopenjp2-specific global declaration
# This will be filled out by __init__()
libopenjp2_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libopenjp2 = "libopenjp2.so.7"


# Relative path to `opj_compress`
const opj_compress_splitpath = ["bin", "opj_compress"]

# This will be filled out by __init__() for all products, as it must be done at runtime
opj_compress_path = ""

# opj_compress-specific global declaration
function opj_compress(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(opj_compress_path)
    end
end


# Relative path to `opj_dump`
const opj_dump_splitpath = ["bin", "opj_dump"]

# This will be filled out by __init__() for all products, as it must be done at runtime
opj_dump_path = ""

# opj_dump-specific global declaration
function opj_dump(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(opj_dump_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"OpenJpeg")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (LittleCMS_jll.PATH_list, libpng_jll.PATH_list, Libtiff_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (LittleCMS_jll.LIBPATH_list, libpng_jll.LIBPATH_list, Libtiff_jll.LIBPATH_list,))

    global opj_decompress_path = normpath(joinpath(artifact_dir, opj_decompress_splitpath...))

    push!(PATH_list, dirname(opj_decompress_path))
    global libopenjp2_path = normpath(joinpath(artifact_dir, libopenjp2_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libopenjp2_handle = dlopen(libopenjp2_path)
    push!(LIBPATH_list, dirname(libopenjp2_path))

    global opj_compress_path = normpath(joinpath(artifact_dir, opj_compress_splitpath...))

    push!(PATH_list, dirname(opj_compress_path))
    global opj_dump_path = normpath(joinpath(artifact_dir, opj_dump_splitpath...))

    push!(PATH_list, dirname(opj_dump_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

