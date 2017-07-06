*Iceberg-Changes
diffToParent
	^ self diffTo: (self parents 
			ifNotEmpty: #first
			ifEmpty: [ nil ])