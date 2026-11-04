[_tb_system_call storage=system/_end_super.ks]

[tb_start_tyrano_code]
*start

[cm]

[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]

[free layer=fix name="end_text"]
[free layer=fix name="title_text"]


[playbgm storage="end_super.mp3" loop="true" volume="25"]

; 暗転背景を表示
[bg storage="black.png" time=1000]

; セリフを表示
[ptext layer=fix name="end_dialogue" x=180 y=300 size=32 color=0xFFFFFF text="特別に、もう少しだけ……ね？♡"]

; クリック待ち
[l]

; セリフを消去
[free layer=fix name="end_dialogue"]

; スチル表示へ
[jump target="*show_still"]


*show_still

[cm]

; ENDスチル表示
[image layer=0 page=fore storage="kemomimi/end/end_super.png" x=0 y=0 visible=true time=1500]

[wait time=500]


[_tb_end_tyrano_code]

[button  storage="end_normal.ks"  target="*end_to_title"  graphic="setting_back.png"  width="300"  height="80"  x="369"  y="547"  _clickable_img="end_normal.png"  ]
[s  ]
[tb_start_tyrano_code]
[s]

*end_to_title

[cm]
[free layer=fix name="end_text"]
[free layer=fix name="title_text"]
[freeimage layer=0 page=fore]


[_tb_end_tyrano_code]

[jump  storage="title_screen.ks"  target="*title"  cond=""  ]
