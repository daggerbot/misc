# Copyright (c) 2021 Marty Mills <daggerbot@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

cmake_minimum_required(VERSION "3.16")

if(NOT TARGET "zstd::zstd")
    include("FindPackageHandleStandardArgs")
    unset(ZSTD_VERSION)

    find_library(ZSTD_LIBRARY "zstd"
        HINTS "$ENV{ZSTDDIR}"
        PATHS "${ZSTD_PREFIX}")

    find_path(ZSTD_INCLUDE_DIR "zstd.h"
        HINTS "$ENV{ZSTDDIR}"
        PATHS "${ZSTD_PREFIX}"
        PATH_SUFFIXES "include")

    if(ZSTD_LIBRARY AND ZSTD_INCLUDE_DIR)
        file(READ "${ZSTD_INCLUDE_DIR}/zstd.h" _ZSTD_H)
        string(REGEX MATCH "#[ \\t]*define[ \\t]+ZSTD_VERSION_MAJOR[ \\t]+([0-9]+)" _ZSTD_VERSION_MAJOR "${_ZSTD_H}")
        string(REGEX MATCH "#[ \\t]*define[ \\t]+ZSTD_VERSION_MINOR[ \\t]+([0-9]+)" _ZSTD_VERSION_MINOR "${_ZSTD_H}")
        string(REGEX MATCH "#[ \\t]*define[ \\t]+ZSTD_VERSION_RELEASE[ \\t]+([0-9]+)" _ZSTD_VERSION_RELEASE "${_ZSTD_H}")

        if(_ZSTD_VERSION_MAJOR AND _ZSTD_VERSION_MINOR AND _ZSTD_VERSION_RELEASE)
            string(REGEX REPLACE "#[ \\t]*define[ \\t]+ZSTD_VERSION_MAJOR[ \\t]+([0-9]+)" "\\1" _ZSTD_VERSION_MAJOR "${_ZSTD_VERSION_MAJOR}")
            string(REGEX REPLACE "#[ \\t]*define[ \\t]+ZSTD_VERSION_MINOR[ \\t]+([0-9]+)" "\\1" _ZSTD_VERSION_MINOR "${_ZSTD_VERSION_MINOR}")
            string(REGEX REPLACE "#[ \\t]*define[ \\t]+ZSTD_VERSION_RELEASE[ \\t]+([0-9]+)" "\\1" _ZSTD_VERSION_RELEASE "${_ZSTD_VERSION_RELEASE}")
            set(ZSTD_VERSION_MAJOR "${_ZSTD_VERSION_MAJOR}" CACHE INTERNAL "")
            set(ZSTD_VERSION_MINOR "${_ZSTD_VERSION_MINOR}" CACHE INTERNAL "")
            set(ZSTD_VERSION_PATCH "${_ZSTD_VERSION_PATCH}" CACHE INTERNAL "")
            set(ZSTD_VERSION "${ZSTD_VERSION_MAJOR}.${ZSTD_VERSION_MINOR}.${ZSTD_VERSION_PATCH}" CACHE INTERNAL "")
        endif()

        unset(_ZSTD_H)
        unset(_ZSTD_VERSION_MAJOR)
        unset(_ZSTD_VERSION_MINOR)
        unset(_ZSTD_VERSION_RELEASE)
    endif()

    if(ZSTD_VERSION)
        set(ZSTD_FOUND ON CACHE INTERNAL "")
        add_library("zstd::zstd" INTERFACE IMPORTED GLOBAL)
        target_include_directories("zstd::zstd" SYSTEM INTERFACE "${ZSTD_INCLUDE_DIR}")
        target_link_libraries("zstd::zstd" INTERFACE "${ZSTD_LIBRARY}")
    endif()

    find_package_handle_standard_args("zstd"
        REQUIRED_VARS ZSTD_LIBRARY ZSTD_FOUND
        VERSION_VAR ZSTD_VERSION)
endif()
