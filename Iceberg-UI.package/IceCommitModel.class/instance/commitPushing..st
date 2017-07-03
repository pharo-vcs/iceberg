actions
commitPushing: pushBoolean
	| text |
	
	(text := self messageText) ifEmpty: [ ^ self ].
	UIManager default
		informUserDuring: [ :bar | 
			bar label: ('Commiting changes to {1}' format: {self repository}).
			self basicCommitWithMessage: text ifCancel: [ ^ self ].
			pushBoolean ifTrue: [ | remote |
				remote := self repository pushRemote.
				bar label: ('Pushing changes to {1}' format: {remote}).
				self pushRepository: self repository andThen: [ ]. 
				UIManager default inform: ('Uploaded changes to {1}' format: {remote}) ] ]