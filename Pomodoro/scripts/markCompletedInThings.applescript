tell application "System Events" to if exists process "Things" then
	tell application "Things"
		repeat with selectedToDo in to dos of list "Today"
			if name of selectedToDo = "$pomodoroName" then
				set notes of selectedToDo to "completed on " & (time string of (current date))
				set status of selectedToDo to completed
				exit repeat
			end if
		end repeat
	end tell
end if