function(link_stb_image target MOD)
    target_link_libraries(${target} ${MOD} "${PROJECT_SOURCE_DIR}/thirdparty/stb/lib/libstb_image.a")
    target_include_directories(${target} ${MOD} "${PROJECT_SOURCE_DIR}/thirdparty/stb/include")
endfunction()

function(link_stb_truetype target MOD)
    target_link_libraries(${target} ${MOD} "${PROJECT_SOURCE_DIR}/thirdparty/stb/lib/libstb_truetype.a")
    target_include_directories(${target} ${MOD} "${PROJECT_SOURCE_DIR}/thirdparty/stb/include")
endfunction()
