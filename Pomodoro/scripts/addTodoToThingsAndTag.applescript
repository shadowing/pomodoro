tell application "System Events" to if exists process "Things" then
	tell application "Things"
		set allNames to {}
		repeat with selectedToDo in to dos of list "Today"
			set end of allNames to name of selectedToDo
		end repeat
		if allNames does not contain "$pomodoroName" then
			set newToDo to make new to do with properties {name:"$pomodoroName"} at end of list "Today"
			set tag names of newToDo to "pomodoro"
		end if
	end tell
end if