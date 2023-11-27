"
I am a CmUICommand that is specialized for Iceberg UI. 

In particular, I'm used to wrap instances of IceTipCommand in a IceTipBrowser.
"
Class {
	#name : 'IceTipSpCommand',
	#superclass : 'CmUICommand',
	#instVars : [
		'presenterBuildingStrategy'
	],
	#category : 'Iceberg-TipUI-Spec2',
	#package : 'Iceberg-TipUI',
	#tag : 'Spec2'
}

{ #category : 'presenter building' }
IceTipSpCommand >> buildPresenter [

	^ self presenterBuildingStrategy resultOn: self
]

{ #category : 'presenter building' }
IceTipSpCommand >> configureAsToolbarButton [

	self presenterBuildingStrategy: IceTipToolbarButtonStrategy new
]

{ #category : 'displaying' }
IceTipSpCommand >> displayIn: aMenuGroupOrPresenter do: aBlock [

	self displayStrategy 
		display: self 
		in: aMenuGroupOrPresenter 
		do: aBlock
]

{ #category : 'displaying' }
IceTipSpCommand >> ifVisible: aBlock [

	self displayStrategy ifVisible: self do: aBlock
]

{ #category : 'initialization' }
IceTipSpCommand >> initialize [

	super initialize.
	self configureAsToolbarButton
]

{ #category : 'accessing' }
IceTipSpCommand >> presenterBuildingStrategy [
	^ presenterBuildingStrategy
]

{ #category : 'accessing' }
IceTipSpCommand >> presenterBuildingStrategy: aStrategy [
	presenterBuildingStrategy := aStrategy
]

{ #category : 'accessing' }
IceTipSpCommand >> toolbarItemName [

	^ self decoratedCommand toolbarItemName
]
