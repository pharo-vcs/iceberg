Class {
	#name : #IceTipSpCommand,
	#superclass : #CmUICommand,
	#instVars : [
		'presenterBuildingStrategy'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'presenter building' }
IceTipSpCommand >> buildPresenter [

	^ self presenterBuildingStrategy resultOn: self
]

{ #category : #'presenter building' }
IceTipSpCommand >> configureAsToolbarButton [

	self presenterBuildingStrategy: IceTipToolbarButtonStrategy new
]

{ #category : #displaying }
IceTipSpCommand >> displayIn: aMenuGroupOrPresenter do: aBlock [

	self displayStrategy 
		display: self 
		in: aMenuGroupOrPresenter 
		do: aBlock
]

{ #category : #'presenter building' }
IceTipSpCommand >> initialize [

	super initialize.
	self configureAsToolbarButton
]

{ #category : #accessing }
IceTipSpCommand >> presenterBuildingStrategy [
	^ presenterBuildingStrategy
]

{ #category : #accessing }
IceTipSpCommand >> presenterBuildingStrategy: anObject [
	presenterBuildingStrategy := anObject
]

{ #category : #accessing }
IceTipSpCommand >> toolbarItemName [

	^ self decoratedCommand toolbarItemName
]
