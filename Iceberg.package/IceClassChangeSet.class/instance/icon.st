as yet unclassified
icon
	^ self classDefinition
		ifNotNil: #icon
		ifNil: [ 
			self isExtension
				ifTrue: [ #protocolExtension asIcon ]
				ifFalse: [ self targetClass icon ] ]