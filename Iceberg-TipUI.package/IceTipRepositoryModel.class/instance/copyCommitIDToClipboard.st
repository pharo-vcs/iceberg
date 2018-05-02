operations
copyCommitIDToClipboard
	<noCache>
	Clipboard clipboardText: self commitId.
	UIManager default inform: 'Commitish ID copied to clipboard'