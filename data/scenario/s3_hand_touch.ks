[_tb_system_call storage=system/_s3_hand_touch.ks]

*hand3

[playse  volume="20"  time="1000"  buf="0"  storage="touch/hand.mp3"  ]
[tb_image_show  time="300"  storage="default/heart2.png"  width="640"  height="960"  x="-208"  y="365"  _clickable_img="qqq3.png"  ]
[tb_start_tyrano_code]
;========================
; scene3 手クリック
;========================

[eval exp="f.excite += 3"]
[eval exp="f.hand_count += 1"]
[eval exp="f.last_touch='hand'"]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[freeimage layer=2 name="s3_face"]
[image storage="chara/9/_parts/te/s3_hand_touch.png" layer=2 page=fore name="s3_face" x=0 y=0]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

var msgs_hand = ["……今日は、私からでもいいですか","手……離さなくても、大丈夫です","……少しだけ、こうしていたいです"];

f.msg = msgs_hand[Math.floor(Math.random() * msgs_hand.length)];

[endscript]

[free layer=fix name="msg_ui"]

[ptext name="msg_ui" layer=fix x=100 y=560 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=4000]

[free layer=fix name="msg_ui"]

[freeimage layer=2 name="s3_face"]
[image storage="chara/9/_parts/te/s3_wait.png" layer=2 page=fore name="s3_face" x=0 y=0]

[jump storage="scene3.ks" target="*main_loop"]
[_tb_end_tyrano_code]

