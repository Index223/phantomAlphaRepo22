mob
	var
		cpu_total
		cpu_readings
		cpu_average
obj
	cpu_display
		screen_loc = "1,13:32"
		plane = 3
		maptext_width = 256
		New()

			..()

			spawn(1)
				while(src&&usr)

					usr.cpu_total += world.cpu
					usr.cpu_readings++
					usr.cpu_average = usr.cpu_total / usr.cpu_readings
					maptext = "<font color=yellow><font size=2><b>CPU: [world.cpu]%</font>"
					sleep(0.25*10)