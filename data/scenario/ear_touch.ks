[_tb_system_call storage=system/_ear_touch.ks]

*ear

[tb_image_show  time="50"  storage="default/question.png"  width="640"  height="960"  x=""  y=""  _clickable_img="aka0012.png"  ]
[chara_part  name="aka"  time="500"  a="none"  c="none"  e="none"  b="009.png"  d="none"  f="none"  g="none"  g1="none"  aka1="aka001b.png"  aka2="none"  目="aka001e.png"  口="aka002b.png"  眉="aka003b.png"  頬="none"  感情="none"  ]
[tb_image_hide  time="500"  ]
[tb_start_tyrano_code]
[iscript]
f.love = Math.min(f.love + 10,50);

f.love_text = "LOVE:" + f.love;

f.love_box = Math.floor(f.love / 10);

f.love_bar = "■".repeat(f.love_box) + "□".repeat(5 - f.love_box);

var rnd = Math.floor(Math.random() * 3);

if(rnd == 0){

f.msg = "ひゃっ…";

}else if(rnd == 1){

f.msg = "み、耳はちょっと…";

}else{

f.msg = "くすぐったいよ…";

}
[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[iscript]

if(f.excite >= 70){

var msgs = [
"そ、そこはずるいって…",

"変に意識しちゃう…",

"……っ、だめ…"

];

f.next_face = "doki";

}else{

var msgs = [
"ひゃっ…",

"くすぐったいよ…",

"んぅ…"
];

f.next_face = "blush";

}

f.msg = msgs[Math.floor(Math.random() * msgs.length)];

[endscript]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[ptext name="msg_ui" layer=fix x=220 y=460 size=40 color=0xffffff edge="4px #000000" text=&f.msg]

[wait time=700]
[free layer=fix name="msg_ui"]
[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]

[ptext name="love_ui" layer=fix x=40 y=40 size=30 color=0xff66aa text=&f.love_text]
[ptext name="love_bar_ui" layer=fix x=40 y=80 size=32 color=0xff99cc text=&f.love_bar]


[_tb_end_tyrano_code]

[tb_start_tyrano_code]

[jump storage="scene1.ks" target="*main_loop"]
[_tb_end_tyrano_code]

