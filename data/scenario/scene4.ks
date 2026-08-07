[_tb_system_call storage=system/_scene4.ks]

[tb_start_tyrano_code]
*start

[wait time=300]

[_tb_end_tyrano_code]

[bg  time="100"  method="crossfade"  storage="bk000.png"  cross="false"  ]
[chara_hide  name="ccc1"  time="100"  wait="false"  pos_mode="false"  ]
[tb_image_hide  time="100"  ]
[chara_show  name="ddd"  time="100"  wait="false"  storage="chara/11/masiro004aa1.png"  width="640"  height="960"  ]
[chara_move  name="ddd"  anim="true"  time="2000"  effect="linear"  wait="false"  left="-141"  top="-105"  width="953"  height="1432"  ]
[mask  time="2000"  effect="fadeIn"  color="0x000000"  ]
[chara_hide  name="ddd"  time="100"  wait="false"  pos_mode="false"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004aa.png"  width="640"  height="960"  name="img_5"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004bb.png"  width="640"  height="960"  ]
[playse  volume="20"  time="1000"  buf="0"  storage="touch/可愛い動作.mp3"  ]
[tb_image_show  time="2000"  storage="default/masiro004cc.png"  width="640"  height="960"  ]
[tb_start_tyrano_code]


[free layer=fix name="msg_ui"][ptext name="msg_ui" layer=fix x=150 y=460 size=40 color=0xffffff edge="4px #000000"text="……あったかいね……"]

[p]

[free layer=fix name="msg_ui"]


;=========================
; 「……ありがとう。」
;=========================

[ptext name="msg_ui" layer=fix x=150 y=460 size=40 color=0xffffff edge="4px #000000"text="……ありがとう。"]

[p]

[free layer=fix name="msg_ui"]



[_tb_end_tyrano_code]

[tb_image_hide  time="100"  ]
[tb_image_show  time="1000"  storage="default/bk000.png"  width="640"  height="960"  ]
[tb_start_tyrano_code]
[free layer=fix name="msg_ui"]


[ptext name="msg_ui" layer=fix x=240 y=430 size=42 color=0xffffff edge="4px #000000"text="またね。"]

[p]

[free layer=fix name="msg_ui"]


[_tb_end_tyrano_code]

[tb_image_hide  time="1000"  ]
[tb_start_tyrano_code]
;=========================
; Scene4終了 → タイトルへ
;=========================

[free layer=fix name="msg_ui"]
[cm]
[clearfix]
[freeimage layer=0]
[freeimage layer=1]
[freeimage layer=2]
[freeimage layer=3]

[wait time=1000]



[_tb_end_tyrano_code]

[tb_start_tyrano_code]

[jump storage="title_screen.ks" target="*rstart"]
[_tb_end_tyrano_code]

[s  ]
