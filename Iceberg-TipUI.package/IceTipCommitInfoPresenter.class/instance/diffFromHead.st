private
diffFromHead
	
	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipDiffPanel on: (headTabContainer diffFor: selectedModel)