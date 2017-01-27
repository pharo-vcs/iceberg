private
cleanUpInstanceVariables
	self class allInstVarNames do: [ :name |
		(name = 'testSelector' or: [name = 'testParameters']) ifFalse: [
			self instVarNamed: name put: nil ] ]