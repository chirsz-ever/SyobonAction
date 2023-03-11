# use DXLIB_PATH to specify the path of the DxLib which you want to link

include(FetchContent)

if (CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(DXLIB_ARCH1 i686)
    set(DXLIB_ARCH2 x86)
elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(DXLIB_ARCH1 x86_64)
    set(DXLIB_ARCH2 x64)
else ()
    message(FATAL "unsupport platform")
endif ()

if (NOT DEFINED DXLIB_PATH)
    # default use non-sofware-renderer & non-3d version
    if (MSVC)
        set(DXLIB_URL "https://dxlib.xsrv.jp/DxLib/DxLibNoneModel_NoneSoftDrawCode_VC_3_24b.zip")
        set(DXLIB_SHA1 "ccfa6d020ef22265d8253f19cee992eab8e52241")
        set(DXLIB_DOWNLOAD_PATH "${CMAKE_CURRENT_LIST_DIR}/dxlib-msvc")
        set(DXLIB_PATH "${DXLIB_DOWNLOAD_PATH}")
    elseif (MINGW)
        set(DXLIB_URL "https://dxlib.xsrv.jp/DxLib/DxLibNoneModel_NoneSoftDrawCode_GCC_MinGW_3_24b.zip")
        set(DXLIB_SHA1 "9329572a266e048f59dcefc7974ca1397b640595")
        set(DXLIB_DOWNLOAD_PATH "${CMAKE_CURRENT_LIST_DIR}/dxlib-mingw")
        set(DXLIB_PATH "${DXLIB_DOWNLOAD_PATH}/5_2_0_w64/${DXLIB_ARCH1}")
    else ()
        message(FATAL "unsupported compiler")
    endif ()

    FetchContent_Declare(
        dxlib
        URL          ${DXLIB_URL}
        URL_HASH     SHA1=${DXLIB_SHA1}
        DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}
        SOURCE_DIR   ${DXLIB_DOWNLOAD_PATH}
    )
    FetchContent_GetProperties(dxlib)
    if(NOT dxlib_POPULATED)
        message("downloading ${DXLIB_URL} to ${CMAKE_CURRENT_LIST_DIR}...")
        FetchContent_Populate(dxlib)
    endif()
endif ()

message("use DXLIB_PATH=${DXLIB_PATH}")

set(DXLIB_LIBS
    DxLib
    DxUseCLib
    DxDrawFunc
    jpeg
    png
    zlib
    tiff
    theora_static
    vorbis_static
    vorbisfile_static
    ogg_static
    opusfile
    opus
    silk_common
    celt
    bulletdynamics
    bulletcollision
    bulletmath
)

set(DXLIB_D_ "$<$<CONFIG:Debug>:_d>")

if (MSVC)
    if (CMAKE_MSVC_RUNTIME_LIBRARY MATCHES "^MultiThreaded(Debug)?DLL$")
        set(DXLIB_MSVC_RT "MD")
    elseif (CMAKE_MSVC_RUNTIME_LIBRARY MATCHES "^MultiThreaded(Debug)?$")
        set(DXLIB_MSVC_RT "MT")
    else ()
        message("CMAKE_MSVC_RUNTIME_LIBRARY=${CMAKE_MSVC_RUNTIME_LIBRARY}, use /MD(d)")
        set(DXLIB_MSVC_RT "MD")
    endif ()

    if (MSVC_VERSION EQUAL 1200) # Visual C++ 6.0
        set(DXLIB_LIB_SUFFIX "_vc6${DXLIB_D_}")
    elseif (MSVC_VERSION EQUAL 1400) # Visual C++ 8.0
        set(DXLIB_LIB_SUFFIX "_vc8_${DXLIB_ARCH2}${DXLIB_D_}")
    elseif (MSVC_TOOLSET_VERSION EQUAL 110) # VS2012
        set(DXLIB_LIB_SUFFIX "_vs2012_${DXLIB_ARCH2}${DXLIB_D_}")
    elseif (MSVC_TOOLSET_VERSION EQUAL 120) # VS2013
        set(DXLIB_LIB_SUFFIX "_vs2013_${DXLIB_ARCH2}${DXLIB_D_}")
    elseif (MSVC_TOOLSET_VERSION GREATER_EQUAL 140) # VS2015~VS2022
        set(DXLIB_LIB_SUFFIX "_vs2015_${DXLIB_ARCH2}_${DXLIB_MSVC_RT}")
    else ()
        set(DXLIB_LIB_SUFFIX "${DXLIB_D_}")
    endif ()

    foreach (lib IN LISTS DXLIB_LIBS)
        if (lib MATCHES "^(bullet|jpeg|theora|tiff|png)")
            set(DXLIB_LIB_PREFIX "lib")
        else ()
            set(DXLIB_LIB_PREFIX "")
        endif ()

        if (MSVC_TOOLSET_VERSION GREATER_EQUAL 110 OR lib MATCHES "^bullet")
            if (MSVC_TOOLSET_VERSION GREATER_EQUAL 140)
                set(LIB_PATH
                    debug "${DXLIB_PATH}/${DXLIB_LIB_PREFIX}${lib}${DXLIB_LIB_SUFFIX}d.lib"
                    optimized "${DXLIB_PATH}/${DXLIB_LIB_PREFIX}${lib}${DXLIB_LIB_SUFFIX}.lib"
                )
            else ()
                set(LIB_PATH "${DXLIB_PATH}/${DXLIB_LIB_PREFIX}${lib}${DXLIB_LIB_SUFFIX}.lib")
            endif ()
        else ()
            set(LIB_PATH "${DXLIB_PATH}/${DXLIB_LIB_PREFIX}${lib}${DXLIB_D_}.lib")
        endif ()

        list(APPEND DXLIB_LIBFILES ${LIB_PATH})
    endforeach ()
elseif (MINGW)
    foreach (lib IN LISTS DXLIB_LIBS)
        list(APPEND DXLIB_LIBFILES "${DXLIB_PATH}/lib${lib}.a")
    endforeach ()
else ()
    message(FATAL "unsupported compiler")
endif ()

add_library(dxlib INTERFACE)
target_include_directories(dxlib INTERFACE ${DXLIB_PATH})
target_link_libraries(dxlib INTERFACE ${DXLIB_LIBFILES})
