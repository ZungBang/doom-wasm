#!/bin/bash

cd "`dirname \"$0\"`/.."

emmake make clean
emconfigure autoreconf -fiv
ac_cv_exeext=".html" emconfigure ./configure --host=none-none-none

emmake make

pushd src
emcc -I../textscreen -I../opl -I../pcsound  -O3 -g -Wall -Wdeclaration-after-statement -Wredundant-decls     -gsource-map -s INVOKE_RUN=1 -s USE_SDL=2 -s USE_SDL_MIXER=2 -s LEGACY_GL_EMULATION=0 -s USE_SDL_NET=2 -s ASSERTIONS=0 -s WASM=1 -s ALLOW_MEMORY_GROWTH=0 -s FORCE_FILESYSTEM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=['FS','ccall'] -s SAFE_HEAP=1 -s EXIT_RUNTIME=1 -s STACK_OVERFLOW_CHECK=1 -s PROXY_POSIX_SOCKETS=0 -s USE_PTHREADS=0 -s PROXY_TO_PTHREAD=0 -s TOTAL_MEMORY=64MB -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s ASYNCIFY -O3 --source-map-base /  -gsource-map -s INVOKE_RUN=1 -s USE_SDL=2 -s USE_SDL_MIXER=2 -s LEGACY_GL_EMULATION=0 -s USE_SDL_NET=2 -s ASSERTIONS=0 -s WASM=1 -s ALLOW_MEMORY_GROWTH=0 -s FORCE_FILESYSTEM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=['FS','ccall'] -s SAFE_HEAP=1 -s EXIT_RUNTIME=1 -s STACK_OVERFLOW_CHECK=1 -s PROXY_POSIX_SOCKETS=0 -s USE_PTHREADS=0 -s PROXY_TO_PTHREAD=0 -s TOTAL_MEMORY=64MB -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s ASYNCIFY -O3 --source-map-base / -lwebsocket.js -o websockets-doom.html i_main.o i_system.o m_argv.o m_misc.o aes_prng.o d_event.o d_iwad.o d_loop.o d_mode.o deh_str.o gusconf.o i_cdmus.o i_endoom.o i_glob.o i_input.o i_joystick.o i_midipipe.o i_musicpack.o i_oplmusic.o i_pcsound.o i_sdlmusic.o i_sdlsound.o i_sound.o i_timer.o i_video.o i_videohr.o midifile.o mus2mid.o m_bbox.o m_cheat.o m_config.o m_controls.o m_fixed.o net_client.o net_common.o net_dedicated.o net_gui.o net_io.o net_loop.o net_websockets.o net_packet.o net_petname.o net_query.o net_server.o net_structrw.o sha1.o memio.o tables.o v_diskicon.o v_video.o w_checksum.o w_main.o w_wad.o w_file.o w_file_stdc.o w_file_posix.o w_file_win32.o w_merge.o z_zone.o deh_io.o deh_main.o deh_mapping.o deh_text.o doom/libdoom.a ../textscreen/libtextscreen.a ../pcsound/libpcsound.a ../opl/libopl.a -gsource-map -s INVOKE_RUN=1 -s USE_SDL=2 -s USE_SDL_MIXER=2 -s LEGACY_GL_EMULATION=0 -s USE_SDL_NET=2 -s ASSERTIONS=0 -s WASM=1 -s ALLOW_MEMORY_GROWTH=0 -s FORCE_FILESYSTEM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=['FS','ccall'] -s SAFE_HEAP=1 -s EXIT_RUNTIME=1 -s STACK_OVERFLOW_CHECK=1 -s PROXY_POSIX_SOCKETS=0 -s USE_PTHREADS=0 -s PROXY_TO_PTHREAD=0 -s TOTAL_MEMORY=64MB -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s ASYNCIFY -O3 --source-map-base / -lwebsocket.js  -lm --embed-file doom1.wad --embed-file default.cfg
popd
