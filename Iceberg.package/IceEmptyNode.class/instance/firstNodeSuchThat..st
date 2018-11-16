enumerating
firstNodeSuchThat: conditionBlock 
	
	^ self firstNodeSuchThat: conditionBlock ifNone: [ NotFound signalFor: conditionBlock ]