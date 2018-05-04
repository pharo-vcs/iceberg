execution
execute
	| id |
	id := selectedCommit id.
	Clipboard clipboardText: id.
	UIManager inform: 'Commitish ID copied to clipboard (' , id , ')'