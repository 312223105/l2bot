; Skills
global const $kBuffKey = "3"
global const $kAssistKey = "{F11}"

func OnAttack()
endfunc

func OnAttackSkill()
endfunc

func OnFirstKill()
	SendClient($kCancelTarget, 200)
	FollowLider()
endfunc

func OnAllKill()
	PickDrop(5)
endfunc

func NextTarget()
	LogWrite("NextTarget()")
	SendTextClient("/target " & $kLeaderName)
	SendClient($kAssistKey, 1000)
endfunc

func OnAttackTimeout()
	SendClient($kCancelTarget, 50)
	ChangePosition()
endfunc

func OnBuffTimeout()
	LogWrite("OnBuffTimeout() - warcrayer")
	SendClient($kBuffKey, 12 * 1000)
endfunc

func OnHealthCritical()
endfunc

func OnHealthHalf()
	PotionHealing()
endfunc