Extension { #name : #StringMorph }

{ #category : #'*Iceberg-Pharo6' }
StringMorph >> addEmphasis: aCodeOrTextEmphasis [
	self emphasis: (emphasis bitOr: aCodeOrTextEmphasis value)
]
