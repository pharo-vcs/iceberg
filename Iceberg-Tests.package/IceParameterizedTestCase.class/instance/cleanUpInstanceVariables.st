private
cleanUpInstanceVariables
	| instanceVariablesNames |
	instanceVariablesNames := #('testSeletor' 'testParameters').
	self class allInstVarNames
		do: [ :name | 
			(instanceVariablesNames includes: name)
				ifFalse: [ self instVarNamed: name put: nil ] ]