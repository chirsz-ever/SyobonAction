cmake . -B cmake-build-vc6 -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release
call vc6-patch.bat patch
cmake --build cmake-build-vc6
call vc6-patch.bat unpatch
