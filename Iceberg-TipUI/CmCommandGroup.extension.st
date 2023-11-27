Extension { #name : 'CmCommandGroup' }

{ #category : '*Iceberg-TipUI' }
CmCommandGroup >> commandOrGroupNamed: aString ifFound: aBlock [

	^ entries
		  detect: [ :commandOrRegister | commandOrRegister name = aString ]
		  ifFound: aBlock
]
