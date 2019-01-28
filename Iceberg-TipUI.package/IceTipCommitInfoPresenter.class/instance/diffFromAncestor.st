private
diffFromAncestor
	
	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipDiffPanel on: (ancestorTabContainer diffFor: selectedModel)