*Iceberg-Changes
diffToParent
	^ IceDiff 
		from: self 
		to: (self parents 
			ifNotEmpty: #first
			ifEmpty: [ nil ])