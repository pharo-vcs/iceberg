private factory
newMethodDefinitionFrom: anArray
	| metadata className meta selector source  |
	
	metadata := anArray second ifNil: [ Dictionary new ].
	className := anArray fourth first first.
	meta := anArray fourth first second notNil.
	selector := (RBParser parseMethod: anArray fourth second) selector.
	source := String streamContents: [ :s | 
		s << anArray fourth second.
		anArray fifth ifNotEmpty: [ :src | s << src ] ].
	
	^ MCMethodDefinition
		className: className
		classIsMeta: meta
		selector: selector
		category: (metadata at: #category ifAbsent: [ '' ]) 
		timeStamp: nil
		source: source