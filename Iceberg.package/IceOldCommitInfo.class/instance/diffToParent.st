as yet unclassified
diffToParent
	^ self diffTo: (self parents 
			ifNotEmpty: #first
			ifEmpty: [ nil ])