private
showFilterFieldFromKeystrokeEvent: anEvent
	"nothing tho show, we will use a linked text presenter. 
	 intead, transmit the focus (and key) to the linked presenter"
	| text |

	text := anEvent keyCharacter asString.
	self textField takeKeyboardFocus.
	self textField text: self textField text, text.
	self flag: #hack. "I'm going directly to the widget because I need 
	control over the internals to position the cursor."	
	self textField textArea cursorEnd: anEvent