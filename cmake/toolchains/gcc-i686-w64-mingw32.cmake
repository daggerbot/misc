# Copyright (c) 2021 Marty Mills <daggerbot@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

set(CMAKE_AR "i686-w64-mingw32-gcc-ar")
set(CMAKE_ASM_COMPILER "i686-w64-mingw32-gcc")
set(CMAKE_ASM_COMPILER_AR "i686-w64-mingw32-gcc-ar")
set(CMAKE_ASM_COMPILER_RANLIB "i686-w64-mingw32-gcc-ranlib")
set(CMAKE_C_COMPILER "i686-w64-mingw32-gcc")
set(CMAKE_C_COMPILER_AR "i686-w64-mingw32-gcc-ar")
set(CMAKE_C_COMPILER_RANLIB "i686-w64-mingw32-gcc-ranlib")
set(CMAKE_CXX_COMPILER "i686-w64-mingw32-g++")
set(CMAKE_CXX_COMPILER_AR "i686-w64-mingw32-gcc-ar")
set(CMAKE_CXX_COMPILER_RANLIB "i686-w64-mingw32-gcc-ranlib")
set(CMAKE_SYSTEM_NAME "Windows")
set(CMAKE_SYSTEM_PROCESSOR "i686")

# MSYS2 doesn't install windres with a machine triple prefix.
find_program(CMAKE_RC_COMPILER NAMES "i686-w64-mingw32-windres" "windres")
