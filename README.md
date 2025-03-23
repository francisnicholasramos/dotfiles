# Blame & History
`blame_line` - Show git blame for the current line in a floating window.

`blame` - Similar to blame_line, but might be used for additional blame features.

`toggle_current_line_blame` - Toggle inline git blame for the current line (like VSCode).
 
# Staging & Resetting
`stage_hunk` - Stage the current hunk (modified block of code).

`undo_stage_hunk` - Unstage the last staged hunk.

`stage_buffer` - Stage all changes in the current buffer.

`reset_hunk` - 	Revert the current hunk to the last committed state.

`reset_hunk_index` - Reset a hunk by its index instead of selection.

`reset_base` - Reset file to the base revision (default: HEAD).

`reset_buffer` - 	Reset entire buffer (all changes).

# Navigation
`nav_hunk` - Move between hunks (both forward and backward).

`next_hunk` -	Jump to the next hunk.

`prev_hunk` -	Jump to the previous hunk.

# Viewing Changes
`preview_hunk` - Show a floating window preview of the current hunk.

`preview_hunk_inline` -	Show the diff inline instead of a floating window.

`diffthis` - Show a diff view between the current file and the base revision.

# Visual & Signs
`toggle_signs` -	Toggle the sign column (where Git signs appear).

`toggle_numhl` -	Toggle highlighting for line numbers (git status).

`toggle_linehl` -	Toggle line highlighting for changed lines.

`toggle_word_diff` -	Toggle word-level diffs (show inline changes).

# Miscellaneous
`toggle_deleted` -	Show/hide deleted lines in the buffer.

`select_hunk` -	Select the current hunk in visual mode.

`change_base` -	Change the base revision for diffing (default: HEAD).

`get_hunks`	- Get all hunks in the current buffer.

`refresh` -	Refresh GitSigns (useful if signs disappear).

`get_actions` -	Show available actions for the current file.

`setloclist` -	Send hunks to the location list (:lopen).

`setqflist` -	Send hunks to the quickfix list (:copen).

`show` -	Show GitSigns debug info.

# Debugging & Attachments
`attach` -	Attach GitSigns to the current buffer (if it was detached).

`detach` -	Detach GitSigns from the current buffer.

`detach_all` -	Detach GitSigns from all buffers.

`clear_debug` -	Clear debug logs.

`dump_cache` -	Dump GitSigns cache for debugging.

`debug_messages` -	Show debug messages.
