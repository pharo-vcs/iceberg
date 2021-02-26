Class {
	#name : #IceSpPresenterMetaTests,
	#superclass : #TestCase,
	#category : #'Iceberg-UI-Tests'
}

{ #category : #running }
IceSpPresenterMetaTests >> allClassesInAnyIcebergPackage [

	^ Array streamContents: [ :str | 
		  Smalltalk allClassesAndTraitsDo: [ :c | 
			  (c package name beginsWith: 'Iceberg') ifTrue: [ str nextPut: c ] ] ]
]

{ #category : #running }
IceSpPresenterMetaTests >> allMethodsInPresenters [
	
	^ Array streamContents: [ :stream |
		self presenterClasses do: [ :each |
			stream
				nextPutAll: each methods;
			 	nextPutAll: each classSide methods ] ]
]

{ #category : #running }
IceSpPresenterMetaTests >> allMethodsInPresentersThatMatch: aRBPattern [

	| searcher |
	searcher := RBParseTreeSearcher new
		matches: aRBPattern do: [ :node :answer | true ];
		yourself.

	^ self allMethodsInPresenters select: [ :aCompiledMethod |
		searcher
			executeTree: aCompiledMethod parseTree
			initialAnswer: false ].

]

{ #category : #running }
IceSpPresenterMetaTests >> assertSendSuperAllMethodsNamed: aSelector isMeta: isMeta [

	| aCollection |
	aCollection := (self methodsInPresentersWithName: aSelector isMeta: isMeta)
			reject: [ :each |
				each sendNodes anySatisfy: [ :node | 
					node isSuperSend and: [ node selector = aSelector ] ] ].

	self assertEmpty: aCollection.
	
	"
	To browse: 
	
	aCollection do: #browse
	
	"
]

{ #category : #running }
IceSpPresenterMetaTests >> methodsInPresentersWithName: aSelector isMeta: isMeta [

	^ Array streamContents: [ :stream |
		self presenterClasses do: [ :each | 
			(isMeta ifTrue: [ each classSide ] ifFalse:[ each ])
				compiledMethodAt: aSelector ifPresent: [ :m |
					stream nextPut: m ]]]

]

{ #category : #running }
IceSpPresenterMetaTests >> presenterClasses [

	^ self allClassesInAnyIcebergPackage select: [ :each | 
		  each inheritsFrom: SpPresenter ]
]

{ #category : #running }
IceSpPresenterMetaTests >> presenterClassesDefining: aSelector isMeta: isMeta [

	^ (self methodsInPresentersWithName: aSelector isMeta: isMeta)
		collect: [ :each | each origin ]
]

{ #category : #tests }
IceSpPresenterMetaTests >> testDefaultSpecDoesntUsePragma [
	"Do not use the <spec> pragma, that was necessary in Spec1 but not in Spec2."

	| aCollection |
	aCollection := self allMethodsInPresenters select: [ :each |
		each hasPragmaNamed: #spec ].
	self assertEmpty: aCollection.

]

{ #category : #tests }
IceSpPresenterMetaTests >> testDoNotForgetToSendSuper [
	"We do not want to forget to send super on these methods, because each 
	presenter in the hierarchy needs to initialze the sub-presenters it defines."

	self assertSendSuperAllMethodsNamed: #initializePresenters isMeta: false.
	self assertSendSuperAllMethodsNamed: #connectPresenters isMeta: false.
	self assertSendSuperAllMethodsNamed: #initialize isMeta: false.
]

{ #category : #tests }
IceSpPresenterMetaTests >> testDoNotImplementDiscouragedSelectors [

	"Either instance or class-side, the old #title is named #titleForWindow in inst-side."
	self assertEmpty: (self presenterClassesDefining: #title isMeta: true).
	self assertEmpty: (self presenterClassesDefining: #title isMeta: false).

	"The #icon is called #iconForWindow in IceTip UI."
	self assertEmpty: (self presenterClassesDefining: #icon isMeta: true).

	"These methods are not yet deprecated via pragma, but discouraged in Spec2."
	self assertEmpty: (self presenterClassesDefining: #initialExtent isMeta: false).
	self assertEmpty: (self presenterClassesDefining: #initializeWidgets isMeta: false).
	self assertEmpty: (self presenterClassesDefining: #initializePresenter isMeta: false).

	self assertEmpty: (self presenterClassesDefining: #windowIcon isMeta: false).


]

{ #category : #tests }
IceSpPresenterMetaTests >> testDontAccessUnderlyingWidget [
	"In general, we don't want uses of #whenBuiltDo: or #adapter or similar. 
	They are not prohibited by Spec2, but they are often used to manipulate the
	underlaying Morph, assuming that Morphic is the Spec2 application backend."

	| aCollection |
	aCollection := self allMethodsInPresenters
		select: [ :each | each sendsAnySelectorOf: #(whenBuiltDo: adapter widget dataSource) ].

	"Only two exceptions to this rule, for the moment."
	self assertEmpty: aCollection.

	"Browse results with:
	aCollection do: #browse.
	"
]

{ #category : #tests }
IceSpPresenterMetaTests >> testPreferCloseWindow [
	"IceTipSpPresenter provides #closeWindow to avoid 'self window close' and 'self window delete'."

	self assertEmpty: (self allMethodsInPresentersThatMatch: 'self window delete').
	self
		assert: (self allMethodsInPresentersThatMatch: 'self window close')
		equals: { IceTipSpPresenter>>#closeWindow }.

]
