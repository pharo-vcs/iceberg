"
Description
--------------------

I am a cell used to render the header of an outline datasource.

Since the header should not be part of the tree, to collapse it we do not have a button but I am clickable. (I show a web cursor to show the feature to the user)
"
Class {
	#name : #IceTipOutlineHeaderCellMorph,
	#superclass : #FTCellMorph,
	#instVars : [
		'dataSource',
		'item'
	],
	#category : 'Iceberg-TipUI-View-DataSource'
}

{ #category : #'instance creation' }
IceTipOutlineHeaderCellMorph class >> dataSource: aDataSource item: anItem [
	^ self new
		dataSource: aDataSource;
		item: anItem;
		yourself
]

{ #category : #accessing }
IceTipOutlineHeaderCellMorph >> dataSource: aDataSource [ 
	dataSource := aDataSource
]

{ #category : #initialize }
IceTipOutlineHeaderCellMorph >> defaultColor [
	^ self theme backgroundColor negated alpha: 0.05
]

{ #category : #'event handling' }
IceTipOutlineHeaderCellMorph >> handlesMouseDown: evt [
	^ true
]

{ #category : #'event handling' }
IceTipOutlineHeaderCellMorph >> handlesMouseOver: evt [
	^ true
]

{ #category : #accessing }
IceTipOutlineHeaderCellMorph >> item: anItem [ 
	item := anItem
]

{ #category : #'event handling' }
IceTipOutlineHeaderCellMorph >> mouseEnter: evt [
	self currentHand showTemporaryCursor: Cursor webLink.
	super mouseEnter: evt
]

{ #category : #'event handling' }
IceTipOutlineHeaderCellMorph >> mouseLeave: evt [
	self currentHand showTemporaryCursor: nil.
	super mouseLeave: evt
]

{ #category : #'event handling' }
IceTipOutlineHeaderCellMorph >> mouseUp: evt [
	((dataSource canDisplayChildrenOf: item) and: [ item children isNotEmpty ])
		ifTrue: [ item toggle ].
	super mouseUp: evt
]
