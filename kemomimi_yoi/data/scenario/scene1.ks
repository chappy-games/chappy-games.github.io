[_tb_system_call storage=system/_scene1.ks]

*start

[tb_start_tyrano_code]
; =========================
; kemomimi_yoi 初期化
; =========================

; 前半会話
[eval exp="f.talk_count = 0"]
[eval exp="f.talk_max = 12"]
[eval exp="f.like = 0"]

; 待機ポーズ
[eval exp="f.wait_no = 1"]
[eval exp="f.last_wait = 0"]

; 宵ちゃんの出題
; 1 = 色を見る
; 2 = 吹き出し内アイコンを見る
[eval exp="f.prompt_mode = 1"]
[eval exp="f.prompt_color = ''"]
[eval exp="f.prompt_icon = ''"]

; プレイヤー回答
[eval exp="f.player_choice = ''"]

; 判定用
[eval exp="f.answer_correct = false"]

; =========================
; タイトル画面クリア
; =========================

; クリックマップ・ボタンなど
[cm]

; fixレイヤー
[clearfix]

; 前景レイヤー
[freeimage layer=0 page=fore]
[freeimage layer=1 page=fore]
[freeimage layer=2 page=fore]
[freeimage layer=3 page=fore]
[freeimage layer=4 page=fore]

; 背景レイヤー
[freeimage layer=base page=fore]
[_tb_end_tyrano_code]

[jump  storage="s1_talk.ks"  target="*start"  ]
