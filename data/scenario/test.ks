[_tb_system_call storage=system/_test.ks]

*aa

[tb_start_tyrano_code]
; 「ありがとう」を表示
;==============================
; Ending セリフ1
;==============================

[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=220 y=460 size=34 color=0xffffff edge="4px #000000" text="……ねえ。"]

[clickable width=640 height=960 x=0 y=0 target="ending_line2"]
[s]

;==============================
; Ending セリフ2
;==============================

*ending_line2

[clearfix]
[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=220 y=460 size=34 color=0xffffff edge="4px #000000" text="今日は、ありがとう。"]

[clickable width=640 height=960 x=0 y=0 target="ending_line3"]
[s]

;==============================
; Ending セリフ3
;==============================

*ending_line3

[clearfix]
[free layer=fix name="msg_ui"]
[ptext name="msg_ui" layer=fix x=220 y=460 size=34 color=0xffffff edge="4px #000000" text="また、来てくれる？"]

[clickable width=640 height=960 x=0 y=0 target="ending_black_start"]
[s]


;==============================
; 暗転開始
;==============================

*ending_black_start

[clearfix]
[free layer=fix name="msg_ui"]

; まずフェードなしで黒画像を表示
[image storage="ending/black.png" layer=3 page=fore x=0 y=0]

; 黒画面の上に表示
[ptext name="msg_ui" layer=fix x=220 y=460 size=40 color=0xffffff edge="4px #000000" text="ありがとう"]

[clickable width=640 height=960 x=0 y=0 target="ending_to_title"]
[s]
*ending_to_title


; クリック領域を消す
[clearfix]

; Ending表示を消す
[free layer=fix name="msg_ui"]

; 暗転解除
[freeimage layer=3]


; 念のため残留処理をもう一度掃除
[iscript]

$(document).off(".s3hover");

if(window.fhf_love_timer){
clearInterval(window.fhf_love_timer);
window.fhf_love_timer = null;
}

if(window.fhf_heart_timer){
clearInterval(window.fhf_heart_timer);
window.fhf_heart_timer = null;
}

$("#fhf_heart_layer").remove();

f.love_timer_started = false;

[endscript]

[free layer=fix name="love_ui"]
[free layer=fix name="love_bar_ui"]
[free layer=fix name="excite_ui"]
[free layer=fix name="excite_bar_ui"]
[freeimage layer=2]

[stopbgm]

[_tb_end_tyrano_code]

