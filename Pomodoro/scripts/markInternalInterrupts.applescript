tell application "System Events" to if exists process "Things" then
	say "what the fuck, man?"
	set reasons to text returned of (display dialog "please tag this interruption" default answer "shit")
	tell application "Things"
		repeat with selectedToDo in to dos of list "Today"
			if name of selectedToDo = "$pomodoroName" then
				set tagnames to tag names of selectedToDo
				set tag names of selectedToDo to reasons & "," & tagnames
				exit repeat
			end if
		end repeat
	end tell
end if