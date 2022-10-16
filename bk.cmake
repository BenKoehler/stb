add_library(stbimage STATIC EXCLUDE_FROM_ALL ${PROJECT_SOURCE_DIR}/thirdparty/stb/stbimage_impl.cpp)
target_include_directories(stbimage SYSTEM PUBLIC ${PROJECT_SOURCE_DIR}/thirdparty/stb)
ConfigureCompileOptions(stbimage PUBLIC)

function(link_stbimage target MOD)
    target_link_libraries(${target} ${MOD} stbimage)
endfunction()
