cmake_minimum_required(VERSION 3.10)

project(stb
        VERSION 1.0
        LANGUAGES CXX)

# ------------------------------------------------------------------------------------------------------------------------------------
# options
# ----------
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif ()

# ------------------------------------------------------------------------------------------------------------------------------------
# dependencies (third party)
# ----------
include(../../cmake-helpers/ConfigureCompileOptions.cmake)

# ------------------------------------------------------------------------------------------------------------------------------------
# source
# ----------
add_library(stb_image STATIC stbimage_impl.cpp)
ConfigureCompileOptions(stb_image PUBLIC)
target_include_directories(stb_image PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

add_library(stb_truetype STATIC stbtruetype_impl.cpp)
ConfigureCompileOptions(stb_truetype PUBLIC)
target_include_directories(stb_truetype PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

# ------------------------------------------------------------------------------------------------------------------------------------
# run emscripten build
# ----------
add_custom_command(TARGET stb_image POST_BUILD COMMAND ${PROJECT_SOURCE_DIR}/emscripten-compile-stb-image.sh WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

add_custom_command(TARGET stb_truetype POST_BUILD COMMAND ${PROJECT_SOURCE_DIR}/emscripten-compile-stb-truetype.sh WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# ------------------------------------------------------------------------------------------------------------------------------------
# install
# ----------
install(FILES
        "${PROJECT_SOURCE_DIR}/stb_image.h"
        "${PROJECT_SOURCE_DIR}/stb_image_write.h"
        "${PROJECT_SOURCE_DIR}/stb_truetype.h"
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION ${CMAKE_INSTALL_PREFIX}/include
        )

install(FILES
        "$<TARGET_FILE_DIR:stb_image>/libstb_image.a"
        "$<TARGET_FILE_DIR:stb_truetype>/libstb_truetype.a"
        "${PROJECT_SOURCE_DIR}/libstb_image.bc"
        "${PROJECT_SOURCE_DIR}/libstb_truetype.bc"
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
        )

