# Free Syobon Action

The original game developer: ちく [link](https://web.archive.org/web/20100719105700/http://www.geocities.jp/z_gundam_tanosii/Misc/syobon_action_description.html)

The developer of Word 5 to 9: Bluvel [link](http://yaruki0.sakura.ne.jp/programs/action.html)

The original "README" file ("りーどみぃ.txt") is converted into UTF-8 in [README.ja.txt](README.ja.txt).

This version is aim to fix bugs and run the game on systems other than Windows.

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

This source code supports Mingw on Windows so far. 
[TDM-GCC](https://jmeubank.github.io/tdm-gcc/) is recommended.

Building this game dependents on [DxLib](https://dxlib.xsrv.jp/).

The following assumes that you are using TDM-GCC64 9.2 with DxLib version
"7_3_0_x86_64_w64_win32_seh_rt_v5_rev0".

- Make a new subdictory named "dxlib" in the project foler and copy all files of 
  "7_3_0_x86_64_w64_win32_seh_rt_v5_rev0" to it.
- Run `mingw32-make` in the terminal in the project foler.

## TODO List

- [x] Use Unicode string literal, make the game's title displays normally on
      Windows with any character sets
- [ ] fix bugs
  - [ ] stars disappear in the begining of 1-3 sometimes
  - [x] save points in 1-3 works incorrectly
  - [ ] super star in world 1-2-2 fly straight up
