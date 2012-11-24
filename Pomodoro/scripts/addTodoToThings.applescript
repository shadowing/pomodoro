tell application "System Events" to if exists process "Things" then
    tell application "Things"
        set todayToDos to to dos of list "Today"
        set names to {}
        repeat with selectedToDo in todayToDos
            set names to name of selectedToDo & names
        end repeat
        if names does not contain "%@" then
            set newToDo to make new to do with properties {name:"%@"} at end of list "Today"
            set tag names of newTodo to "pomodoro"
        end if
    end tell
end if