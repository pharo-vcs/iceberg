Extension { #name : #CmCommandGroupDecorator }

{ #category : #'*Iceberg-TipUI' }
CmCommandGroupDecorator >> commandOrGroupNamed: aString ifFound: aBlock [

	^ self decoratedGroup commandOrGroupNamed: aString ifFound: aBlock
]
