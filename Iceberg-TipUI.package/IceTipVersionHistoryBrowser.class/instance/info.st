private
info 
	
	selectedModel ifNil: [ ^ self ].
	^ IceTipReadOnlyForm items: selectedModel info