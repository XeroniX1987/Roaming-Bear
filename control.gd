extends Control

# step tracking
var steps : int = 0
var currency : int = 0
var step_ratio : int = 1  # 1 step = 1 currency

# step detect
var last_accel : Vector3 = Vector3.ZERO
var step_threshold : float = 1.2  # adjust sensitivity
var cooldown_time : float = 0.3   # seconds between steps
var time_since_last_step : float = 0.0  # fixed: no spaces in variable name

func _process(delta):
	# accumulate time for cooldown
	time_since_last_step += delta

	var accel = Input.get_accelerometer()  # mobile
	if accel != Vector3.ZERO:
		detect_step(accel)
	else:
		# maybe for pc test
		if Input.is_action_just_pressed("ui_accept"):
			simulate_step()

# step detect from accel
func detect_step(accel: Vector3):
	var accel_change = (accel - last_accel).length()
	if accel_change > step_threshold and time_since_last_step > cooldown_time:
		simulate_step()
		time_since_last_step = 0.0  # reset cooldown after a step
	last_accel = accel

# ui update and step incre
func simulate_step():
	steps += 1
	currency = steps * step_ratio
	$StepsLabel.text = "Steps: %d" % steps
	$CurrencyLabel.text = "Currency: %d" % currency

# pc test
func _on_StepButton_pressed():
	simulate_step()
