INCLUDE(CMakeForceCompiler)

SET(TOOLCHAIN_PREFIX "prizm-" CACHE STRINGH "Prepended to the names of tools in the toolchain; a value of \"foobar\" causes gcc to be \"foobargcc\"")
SET(BASE_DIR "${CMAKE_SOURCE_DIR}/../../")

SET(CMAKE_MODULE_PATH ../)
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_C_COMPILER "${TOOLCHAIN_PREFIX}gcc")
SET(CMAKE_CXX_COMPILER "${TOOLCHAIN_PREFIX}g++")

SET(CMAKE_FIND_ROOT_PATH ../)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

LINK_LIBRARIES(c)

SET(LINKER_SCRIPT "${BASE_DIR}/toolchain/prizm.x")
SET(CMAKE_C_FLAGS "-Os -Wall -mb  -mhitachi -nostdlib -ffunction-sections -fdata-sections")
SET(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})
SET(CMAKE_EXE_LINKER_FLAGS "-L${BASE_DIR}/lib -T${LINKER_SCRIPT} -Wl,-static -Wl,-gc-sections -nostdlib")
SET(CMAKE_SHARED_LINKER_FLAGS "-L${BASE_DIR}/lib -T${LINKER_SCRIPT} -Wl,-static -Wl,-gc-sections -nostdlib")
SET(CMAKE_SHARED_LINKER_FLAGS "-L${BASE_DIR}/lib -T${LINKER_SCRIPT} -Wl,-static -Wl,-gc-sections -nostdlib")
SET(CMAKE_MODULE_LINKER_FLAGS "-L${BASE_DIR}/lib -T${LINKER_SCRIPT} -Wl,-static -Wl,-gc-sections -nostdlib")
SET(CMAKE_CXX_LINK_FLAGS "-L${BASE_DIR}/lib -T${LINKER_SCRIPT} -Wl,-static -Wl,-gc-sections -nostdlib")


SET(CMAKE_C_COMPILER_WORKS 1)
SET(CMAKE_CXX_COMPILER_WORKS 1)
SET(CMAKE_EXECUTABLE_SUFFIX ".bin")

FUNCTION(makeg3a G3A_TARGET G3A_NAME G3A_UNSELECTED G3A_SELECTED)
  ADD_CUSTOM_TARGET(finalize-${G3A_NAME} ALL mkg3a -n basic:${G3A_NAME} -i uns:${G3A_UNSELECTED} -i sel:${G3A_SELECTED} ${G3A_TARGET} ${G3A_TARGET}.g3a DEPENDS ${G3A_TARGET})
ENDFUNCTION(makeg3a G3A_TARGET G3A_NAME G3A_UNSELECTED G3A_SELECTED)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../include)
