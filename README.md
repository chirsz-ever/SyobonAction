# Free Syobon Action

The original game developer: ちく [link](https://web.archive.org/web/20100719105700/http://www.geocities.jp/z_gundam_tanosii/Misc/syobon_action_description.html)

The developer of Word 5 to 9: Bluvel [link](http://yaruki0.sakura.ne.jp/programs/action.html)

The original "README" file ("りーどみぃ.txt") is converted into UTF-8 in [README.ja.txt](README.ja.txt).

This version is aim to keep a copy of compilable source code.

## Operation Explanation

| Key  | Explanation |
| :--: | :---------- |
| <kbd>←</kbd> or <kbd>→</kbd>     | move |
| <kbd>↑</kbd> or <kbd>Z</kbd>     | jump |
| <kbd>space</kbd>                 | double speed |
| <kbd>←</kbd>                     | self-destruction |
| <kbd>ESC</kbd>                   | exit |
| <kbd>F1</kbd>                    | back to the title screen |
| <kbd>0</kbd> at the title screen | strange dungeon (bugs may occur) |

You can play on any stage by pressing <kbd>1</kbd>~<kbd>9</kbd> at the time of title.

## Build Instructions

This source code supports MinGW and MSVC on Windows. [TDM-GCC](https://jmeubank.github.io/tdm-gcc/) is recommended.

Building this game dependents on [DxLib](https://dxlib.xsrv.jp/).

[CMake](https://cmake.org) is needed to build the project. The following is the instructions:
- Install CMake.
- Run CMake configuration command in this project directory. For example, if using TDM-GCC, you need to include the TDM-GCC binary PATH to your PATH and run `cmake . -B cmake-build-msys2 -G "MinGW Makefiles"`.
- Build the proect. With the above example, run `cmake --build cmake-build-msys2`.

Specially, this game support VC6:
- Start CMD, run `VC98\Bin\VCVARS32.BAT` to setup the VC6 environment.
- run `build-vc6.bat` in the project directory.

## TODO List

- [x] Use Unicode string literal, make the game's title displays normally on
      Windows with any character sets
- [ ] fix bugs
  - [ ] stars disappear in the begining of 1-3 sometimes
  - [x] save points in 1-3 works incorrectly
  - [ ] super star in world 1-2-2 fly straight up
