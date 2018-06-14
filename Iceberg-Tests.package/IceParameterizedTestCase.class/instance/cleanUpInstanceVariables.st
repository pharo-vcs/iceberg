private
cleanUpInstanceVariables
	| instanceVariablesNames |
	instanceVariablesNames := #('testSelector' 'testParameters').
	self class allInstVarNames
		do: [ :name | 
			(instanceVariablesNames includes: name)
				ifFalse: [ self instVarNamed: name put: nil ] ]