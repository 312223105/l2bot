global const $kXCenter = 650
global const $kYCenter = 450

func MoveToTarget()
	LogWrite("MoveToTarget()")
	
	if not IsTargetForAttack() then
		return
	endif

	SendClient($kAttackKey, 500)

	SendClient($kCancelTarget, 500)	
	
	local $timeout = 0
	while not IsTargetForAttack()
		$timeout = $timeout + 1
		
		Sleep(500)
		
		if mod($timeout, 5) == 0 and not IsPositionChanged() then
			LogWrite("Move timeout #1")
			OnAttackTimeout()
			return
		endif
		
		if mod($timeout, 40) == 0 then
			LogWrite("Move timeout #2")
			OnAttackTimeout()
			return
		endif
	wend
endfunc

func TurnRight($offset)
	MouseMove($kXCenter, $kYCenter)
	MouseDown("right")
	MouseMove($kXCenter + $offset, $kYCenter)
	Sleep(400)
	MouseUp("right")
endfunc

func TurnLeft($offset)
	MouseMove($kXCenter, $kYCenter)
	MouseDown("right")
	MouseMove($kXCenter - $offset, $kYCenter)
	Sleep(400)
	MouseUp("right")
endfunc

func MoveFront($delay)
	SendClient("{" & $kWalkFrontKey & " down}", $delay)
	SendClient("{" & $kWalkFrontKey & " up}", 0)
endfunc

func MoveBack($delay)
	SendClient("{" & $kWalkBackKey & " down}", $delay)
	SendClient("{" & $kWalkBackKey & " up}", 0)
endfunc

func ChangePosition()
	LogWrite("ChangePosition()")
	
	local $turn = Random(0, 10, 1)
	local $angle = Random(3, 12, 1)
	if $turn < 5 then
		TurnRight($angle)
	else
		TurnLeft($angle)
	endif
	
	Sleep(400)

	local $direction = Random(0, 10, 1)	
	local $delay = Random(3000, 4000, 1)
	if $direction < 5 then
		MoveBack($delay)
	else
		MoveFront($delay)
	endif
endfunc