accessing
patch
	^ patch ifNil: [ patch := MCPatch fromBase: theirs target: mine ]