tell application "System Events" to if exists process "Things" then
	tell application "Things"
		repeat with selectedToDo in to dos of list "Today"
			if name of selectedToDo = "$pomodoroName" then
			-- if name of selectedToDo = "test" then
				set notes of selectedToDo to "completed on " & (time string of (current date))
				set tagNew to {}
				set fst to "False"
				repeat with t in tags of selectedToDo
					set i to name of t
					if i starts with "p:" then
						set AppleScript's text item delimiters to ":"
						set p to "p:" & (text item 2 of i as number) + 1
						set end of tagNew to p
						set fst to "True"
					else
						set end of tagNew to i
					end if
				end repeat
				if fst is "False" then
					set tag names of selectedToDo to tag names of selectedToDo & ",p:1"
				else
					set tag names of selectedToDo to my joinList(tagNew, ", ")
				end if
				--				set status of selectedToDo to completed
				exit repeat
			end if
		end repeat
	end tell
end if

to joinList(aList, delimiter)
	set retVal to ""
	set prevDelimiter to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delimiter
	set retVal to aList as string
	set AppleScript's text item delimiters to prevDelimiter
	return retVal
end joinList
