actions
commitPushing: pushBoolean
	| text |
	
	(text := self messageText) ifEmpty: [ ^ self ].
	UIManager default
		informUserDuring: [ :bar | 
			bar label: ('Commiting changes to {1}' format: { self repository name }).
			pushBoolean ifTrue: [ 
				"Validate I can push before I do the commit so I can handle fast-forwards (or merges)"
				[ self repository validateCanPush ]
				on: IceRemoteDesynchronized 
				do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ] ].
			self basicCommitWithMessage: text ifCancel: [ ^ self ].
			pushBoolean ifTrue: [ | remote |
				remote := self repository pushRemote.
				bar label: ('Pushing changes to {1}' format: {remote displayString}).
				self pushRepository: self repository andThen: [ ]. 
				UIManager default inform: ('Uploaded changes to {1}' format: {remote displayString}) ] ]