[_tb_system_call storage=system/_s2_tail.ks]

[tb_start_tyrano_code]
*start

[eval exp="f.tail_click=0"]
[eval exp="f.tail_great=0"]
[eval exp="f.tail_good=0"]
[eval exp="f.tail_miss=0"]
[eval exp="f.tail_great_streak = 0"]
[eval exp="f.tail_target_x=460"]
[_tb_end_tyrano_code]

[bg  time="100"  method="crossfade"  storage="1.png"  ]
[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene2/rule/s2_rule_01.png" x=270 y=180 visible=true name="s2_rule"]
[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="0"  y="0"  width="960"  height="640"  target="*s2_rule_02"  ]
[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[s  ]
*s2_rule_02

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene2/rule/s2_rule_02.png" x=0 y=0 visible=true name="s2_rule"]

[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="0"  y="0"  width="960"  height="640"  target="*s2_rule_03"  ]
[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[s  ]
*s2_rule_03

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene2/rule/s2_rule_03.png" x=0 y=0 visible=true name="s2_rule"]
[_tb_end_tyrano_code]

[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[clickable  storage="s2_tail.ks"  x="0"  y="0"  width="960"  height="640"  target="*s2_rule_04"  ]
[s  ]
*s2_rule_04

[tb_start_tyrano_code]
[image layer=4 page=fore storage="kemomimi/scene2/rule/s2_rule_04.png" x=0 y=0 visible=true name="s2_rule"]
[_tb_end_tyrano_code]

[playse  volume="100"  time="1000"  buf="0"  storage="se_s2_start.mp3"  ]
[clickable  storage="s2_tail.ks"  x="0"  y="0"  width="960"  height="640"  target="*s2_rule_end"  ]
[s  ]
*s2_rule_end

[tb_start_tyrano_code]
[cm]
[free layer=4 name="s2_rule"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]

; Scene2背景
[bg storage="kemomimi/scene2/s2_bg_club.png" time=0]

; Scene2本体
[image layer=0 page=fore storage="kemomimi/scene2/body/s2_body_base.png" x=0 y=0 visible=true name="s2_body"]

; しっぽ
[image layer=1 page=fore storage="kemomimi/scene2/tail/s2_tail_base.png" x=0 y=0 visible=true]

; 通常表情
[image layer=2 page=fore storage="kemomimi/scene2/react/s2_react_normal.png" x=0 y=0 visible=true name="s2_react"]
; 手・初期位置
[image layer=3 page=fore storage="kemomimi/scene2/hand/s2_hand_01.png" x=0 y=0 visible=true name="s2_hand"]

; =========================
; タイミングUI 仮表示
; =========================

[image layer=4 page=fore storage="kemomimi/scene2/timing/timing_line.png" x=190 y=585 visible=true name="s2_timing_line"]
[image layer=4 page=fore storage="kemomimi/scene2/timing/timing_target.png" x=465 y=580 visible=true name="s2_timing_target"]
[image layer=4 page=fore storage="kemomimi/scene2/timing/timing_cursor.png" x=200 y=565 visible=true name="s2_timing_cursor"]

[image layer=4 page=fore storage="kemomimi/scene2/ui/btn_start.png" x=15 y=575 visible=true name="s2_btn_start"]


; =========================
; カーソル移動準備
; =========================

[iscript]

window.s2TailStop = function(){

window.s2_tail_running = false;

if (window.s2_tail_anim_id) {
cancelAnimationFrame(window.s2_tail_anim_id);
window.s2_tail_anim_id = null;
}
};


window.s2TailStart = function(){

window.s2TailStop();

window.s2_tail_running = true;
window.s2_tail_x = 200;
window.s2_tail_dir = 1;
window.s2_tail_last_time = null;

var leftLimit  = 200;
var rightLimit = 700;
var speed = 300;

function moveCursor(time){

if (!window.s2_tail_running) {
return;
}

if (window.s2_tail_last_time === null) {
window.s2_tail_last_time = time;
}

var dt = (time - window.s2_tail_last_time) / 1000;
window.s2_tail_last_time = time;

window.s2_tail_x += speed * dt * window.s2_tail_dir;

if (window.s2_tail_x >= rightLimit) {
window.s2_tail_x = rightLimit;
window.s2_tail_dir = -1;
}

if (window.s2_tail_x <= leftLimit) {
window.s2_tail_x = leftLimit;
window.s2_tail_dir = 1;
}

var cursor = $(".s2_timing_cursor, [name='s2_timing_cursor']").first();
cursor.css("left", window.s2_tail_x + "px");

// =========================
// カーソル位置に合わせて手を5段階切替
// =========================

var handNo;

// 手はカーソルより少し遅れて追従
var handX = window.s2_tail_x - (window.s2_tail_dir * 150);

if (handX < 300) {
handNo = 1;
} else if (handX < 400) {
handNo = 2;
} else if (handX < 500) {
handNo = 3;
} else if (handX < 600) {
handNo = 4;
} else {
handNo = 5;
}

// 前回と違う段階になった時だけ画像を変更
if (window.s2_hand_no !== handNo) {

var hand = $(".s2_hand, [name='s2_hand']").first();

if (hand.length) {

var handSrc = hand.attr("src");

var handFile = "s2_hand_0" + handNo + ".png";

handSrc = handSrc.replace(
/s2_hand_\d{2}\.png/,
handFile
);

hand.attr("src", handSrc);
}

window.s2_hand_no = handNo;
}

window.s2_tail_anim_id = requestAnimationFrame(moveCursor);
}

window.s2_tail_anim_id = requestAnimationFrame(moveCursor);
};

[endscript]


[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="15"  y="575"  width="180"  height="60"  target="*tail_start"  ]
[tb_start_tyrano_code]
[s]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
*tail_start

[cm]

[iscript]
window.s2TailStart();
[endscript]

; START画像をPUSH画像へ変更
[free layer=4 name="s2_btn_start"]
[image layer=4 page=fore storage="kemomimi/scene2/ui/btn_push.png" x=15 y=575 visible=true name="s2_btn_push"]

; STARTクリックを判定側に持ち越さないため少し待つ
[wait time=300]
[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="15"  y="575"  width="180"  height="60"  target="*tail_judge"  ]
[s  ]
[tb_start_tyrano_code]
*tail_judge


[cm]

[iscript]

var targetX = f.tail_target_x;

// クリック時の判定を進行方向の手前へ15px補正
var adjust = 15;
var judgeX = window.s2_tail_x - (window.s2_tail_dir * adjust);

var diff = Math.abs(judgeX - targetX);
if (diff <= 30) {
f.tail_judge = "great";
f.tail_judge_storage = "kemomimi/scene2/timing/judge_great.png";
f.tail_react_storage = "kemomimi/scene2/react/s2_react_doki.png";
f.tail_stamp_storage = "kemomimi/scene2/stamp/stamp_great.png";
f.tail_great += 1;

// GREAT連続数を加算
f.tail_great_streak += 1;

// 2連続以上で特別表情に差し替え
if (f.tail_great_streak >= 2) {
f.tail_react_storage = "kemomimi/scene2/react/s2_react_doki_streak.png";
}

} else if (diff <= 70) {
f.tail_judge = "good";
f.tail_judge_storage = "kemomimi/scene2/timing/judge_good.png";
f.tail_react_storage = "kemomimi/scene2/react/s2_react_soft.png";
f.tail_stamp_storage = "kemomimi/scene2/stamp/stamp_good.png";
f.tail_good += 1;

// GREAT連続は途切れる
f.tail_great_streak = 0;

} else {
f.tail_judge = "miss";
f.tail_judge_storage = "kemomimi/scene2/timing/judge_miss.png";
f.tail_react_storage = "kemomimi/scene2/react/s2_react_miss.png";
f.tail_stamp_storage = "kemomimi/scene2/stamp/stamp_miss.png";
f.tail_miss += 1;

// GREAT連続は途切れる
f.tail_great_streak = 0;
}

f.tail_click += 1;

if (f.tail_click == 1) {
f.tail_hand_storage = "kemomimi/scene2/hand/s2_hand_02.png";
} else if (f.tail_click == 2) {
f.tail_hand_storage = "kemomimi/scene2/hand/s2_hand_03.png";
} else if (f.tail_click == 3) {
f.tail_hand_storage = "kemomimi/scene2/hand/s2_hand_04.png";
} else {
f.tail_hand_storage = "kemomimi/scene2/hand/s2_hand_05.png";
}





[endscript]

[if exp="f.tail_judge == 'great'"]
[playse storage="se_s2_great.mp3" volume="30"]
[endif]

[if exp="f.tail_judge == 'good'"]
[playse storage="se_s2_good.mp3" volume="30"]
[endif]

[if exp="f.tail_judge == 'miss'"]
[playse storage="se_s2_miss.mp3" volume="30"]
[endif]
[if exp="f.tail_click == 1"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=692 y=30 visible=true name="tail_stamp_1"]
[endif]

[if exp="f.tail_click == 2"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=818 y=42 visible=true name="tail_stamp_2"]
[endif]

[if exp="f.tail_click == 3"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=705 y=150 visible=true name="tail_stamp_3"]
[endif]

[if exp="f.tail_click == 4"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=802 y=137 visible=true name="tail_stamp_4"]
[endif]

[if exp="f.tail_click == 5"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=688 y=263 visible=true name="tail_stamp_5"]
[endif]

[if exp="f.tail_click == 6"]
[image layer=4 page=fore storage=&f.tail_stamp_storage x=816 y=250 visible=true name="tail_stamp_6"]
[endif]

[iscript]

$(".tail_stamp_1, [name='tail_stamp_1']").first().css({
"transform":"rotate(-8deg)",
"transform-origin":"center center"
});

$(".tail_stamp_2, [name='tail_stamp_2']").first().css({
"transform":"rotate(6deg)",
"transform-origin":"center center"
});

$(".tail_stamp_3, [name='tail_stamp_3']").first().css({
"transform":"rotate(-5deg)",
"transform-origin":"center center"
});

$(".tail_stamp_4, [name='tail_stamp_4']").first().css({
"transform":"rotate(10deg)",
"transform-origin":"center center"
});

$(".tail_stamp_5, [name='tail_stamp_5']").first().css({
"transform":"rotate(-12deg)",
"transform-origin":"center center"
});

$(".tail_stamp_6, [name='tail_stamp_6']").first().css({
"transform":"rotate(4deg)",
"transform-origin":"center center"
});

[endscript]
; 表情変更
[free layer=2 name="s2_react"]
[image layer=2 page=fore storage=&f.tail_react_storage x=0 y=0 visible=true name="s2_react"]


[free layer=4 name="s2_judge"]
[image layer=4 page=fore storage=&f.tail_judge_storage x=430 y=300 visible=true name="s2_judge"]

[if exp="f.tail_great_streak >= 2"]

[iscript]

var body = $(".s2_body, [name='s2_body']").first();
var face = $(".s2_react, [name='s2_react']").first();

function shakeX(x){
body.css("transform","translateX(" + x + "px)");
face.css("transform","translateX(" + x + "px)");
}

shakeX(-5);

setTimeout(function(){ shakeX(5);  },60);
setTimeout(function(){ shakeX(-4); },120);
setTimeout(function(){ shakeX(4);  },180);
setTimeout(function(){ shakeX(-2); },240);
setTimeout(function(){ shakeX(0);  },300);

[endscript]

[endif]

[wait time=600]

[free layer=4 name="s2_judge"]

[if exp="f.tail_click >= 6"]
[jump target="*tail_finish"]
[else]
[jump target="*tail_next"]
[endif]
[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="15"  y="575"  width="180"  height="60"  target="*tail_judge"  ]
[tb_start_tyrano_code]
*tail_next

[iscript]

var targets = [350, 410, 465, 520, 580];
var newTarget;

do {
newTarget = targets[Math.floor(Math.random() * targets.length)];
} while (newTarget == f.tail_target_x);

f.tail_target_x = newTarget;

$(".s2_timing_target, [name='s2_timing_target']").first().css("left", f.tail_target_x + "px");

[endscript]
[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="15"  y="575"  width="180"  height="60"  target="*tail_judge"  ]
[s  ]
[tb_start_tyrano_code]
*tail_finish

[cm]

[iscript]
window.s2TailStop();
[endscript]

[free layer=4 name="s2_btn_push"]
[image layer=4 page=fore storage="kemomimi/scene2/ui/btn_finish.png" x=15 y=575 visible=true name="s2_btn_finish"]
[_tb_end_tyrano_code]

[clickable  storage="s3_result.ks"  x="15"  y="575"  width="180"  height="60"  target="*start"  _clickable_img=""  ]
[s  ]
[tb_start_tyrano_code]
*tail_retry

[cm]

[iscript]

window.s2TailStop();

window.s2_tail_x = 215;
window.s2_tail_dir = 1;
window.s2_tail_last_time = null;

f.tail_target_x = 465;

$(".s2_timing_cursor, [name='s2_timing_cursor']").first().css("left","215px");
$(".s2_timing_target, [name='s2_timing_target']").first().css("left","465px");

[endscript]

[eval exp="f.tail_click=0"]
[eval exp="f.tail_great=0"]
[eval exp="f.tail_good=0"]
[eval exp="f.tail_miss=0"]
[eval exp="f.tail_judge=''"]
[eval exp="f.tail_great_streak = 0"]
[free layer=4 name="s2_judge"]

[free layer=4 name="tail_stamp_1"]
[free layer=4 name="tail_stamp_2"]
[free layer=4 name="tail_stamp_3"]
[free layer=4 name="tail_stamp_4"]
[free layer=4 name="tail_stamp_5"]
[free layer=4 name="tail_stamp_6"]
[free layer=2 name="s2_react"]
[image layer=2 page=fore storage="kemomimi/scene2/react/s2_react_normal.png" x=0 y=0 visible=true name="s2_react"]

[free layer=3 name="s2_hand"]
[image layer=3 page=fore storage="kemomimi/scene2/hand/s2_hand_01.png" x=0 y=0 visible=true name="s2_hand"]

[free layer=4 name="s2_btn_push"]
[free layer=4 name="s2_btn_finish"]
[free layer=4 name="s2_btn_start"]

[image layer=4 page=fore storage="kemomimi/scene2/ui/btn_start.png" x=15 y=575 visible=true name="s2_btn_start"]

\
[_tb_end_tyrano_code]

[clickable  storage="s2_tail.ks"  x="15"  y="575"  width="180"  height="60"  target="*tail_start"  ]
[s  ]
