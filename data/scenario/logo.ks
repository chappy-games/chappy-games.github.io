[_tb_system_call storage=system/_logo.ks]

[tb_start_tyrano_code]
*start

; 前画面の要素を念のため消去
[clearfix]
[freeimage layer=1]
[freeimage layer=2]
[freeimage layer=fix]

[bg storage="white.png" time=0]

; サークルロゴをフェード表示
[image storage="logo/chappy_sanpomichi.png"
       layer=1
       page=fore
       x=0
       y=280
       width=640
       height=400
       opacity=0
       name="circle_logo"]

[anim name="circle_logo" opacity=255 time=1000]

; 2秒表示
[wait time=2000]

; フェードアウト
[anim name="circle_logo" opacity=0 time=1000]
[wait time=1000]

; ロゴを消去
[free layer=1 name="circle_logo"]
[freeimage layer=1]

; タイトルへ
[jump storage="title_screen.ks" target="*start"]
[_tb_end_tyrano_code]

