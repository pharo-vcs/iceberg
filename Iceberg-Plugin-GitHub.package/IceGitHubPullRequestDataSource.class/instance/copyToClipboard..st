actions
copyToClipboard: url
	Clipboard clipboardText: url.
	UIManager default inform: ('Url {1} copied to clipboard' format: { url })