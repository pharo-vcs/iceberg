*Iceberg-UI
selectionAction: actionSelector
	"action selector will be sent to the presentation selection. 
	If it accepts one argument, the presentation will be sent."

	^ self action: [ :presentation | 
		(MessageSend 
			receiver: presentation selection 
			selector: actionSelector) 
			cull: presentation ];
		condition: [ :presentation | 
			"This is a minimal condition, that can be overriden (refined) later"
			presentation selection notNil ].
