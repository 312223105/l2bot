#include "source/hooks.au3"
#include "source/debug.au3"
#include "source/functions.au3"
#include "source/buff.au3"

global const $kDelayMinutes = 5
global const $kMessageText = "!������ ����������� ����������� ���� � ��������� �����������:\nhttp://vk.com/l2bot\n��������������� :)"

; This is needed for Windows Vista and above
#requireadmin

; Main Loop
while true
	SendTextClient($kMessageText)
	
	Sleep($kDelayMinutes * $kMinute)
wend
