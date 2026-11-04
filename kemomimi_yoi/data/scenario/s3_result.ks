[_tb_system_call storage=system/_s3_result.ks]

[tb_start_tyrano_code]
*start

[cm]

; BGMを1.5秒かけてフェードアウト
[fadeoutbgm time=3000]
[wait time=3000]

[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]
; =========================
; 総合END判定
; =========================

; SUPER HAPPY
; Scene1も高得点 ＋ しっぽもほぼ完璧
[if exp="f.like >= 21 && f.tail_great >= 5 && f.tail_miss == 0"]
[jump storage="end_super.ks" target="*start"]

[else]

; HAPPY
; Scene1もある程度成功 ＋ しっぽも好成績
[if exp="f.like >= 17 && f.tail_great >= 3"]
[jump storage="end_happy.ks" target="*start"]

[else]

; それ以外
[jump storage="end_normal.ks" target="*start"]

[endif]
[endif]


[_tb_end_tyrano_code]

