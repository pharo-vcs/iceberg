patching
asMCDefinition

	^ MCMethodDefinition 
		className: self className
		classIsMeta: self classIsMeta
		selector: self name
		category: self protocol
		timeStamp: ''
		source: sourceCode