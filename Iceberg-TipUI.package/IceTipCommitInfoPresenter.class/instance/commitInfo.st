private
commitInfo

	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipReadOnlyForm items: selectedModel info