cmake_policy(SET CMP0091 NEW)
cmake_minimum_required(VERSION 3.15)
project(FreeSyobonAction)

if (CMAKE_BUILD_TYPE STREQUAL "")
    set(CMAKE_BUILD_TYPE "Debug")
endif ()

# use DXLIB_PATH to specify the path of the DxLib which you want to link
include(3rdparty/dxlib.cmake)

set(SOURCE_FILES
    src/main.cpp
    src/main.h
    src/loadg.cpp
    src/resource.rc
    src/icon.ico
)

add_executable(syobon_action WIN32 ${SOURCE_FILES})

# VC6 workaround
if (MSVC_VERSION EQUAL 1200)
    target_compile_options(syobon_action
        PRIVATE $<IF:$<CONFIG:Debug>,/MLd,/ML>
    )
endif ()

target_link_libraries(syobon_action dxlib)

foreach (dir BGM res SE)
    file(GLOB ${dir}_FILES "${dir}/*")
    add_custom_command(
        TARGET syobon_action
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${dir}
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${${dir}_FILES} ${dir}
        COMMENT "Copying resources to \"${dir}\"..."
    )
endforeach ()
