"
I'm a ""read only form"", used to display data in a more readable way than a list morph or a panel morph.
I receive a list of ""label"" and ""values"", being label a string and value a string or text object.

I can show lists of elements as this example shows: 

IceTipReadOnlyForm new 
	addLabel: 'Commit:' value: 'a test';
	addLabel: 'Parents:' value: '123456789';
	addLabel: 'Author:' value: 'Some Author <author@email.net>';
	addLabel: 'Date:' value: DateAndTime now asStringYMDHM;
	addLabel: 'Labels:' value: '';
	addLabel: 'Comment' value: String loremIpsum;
	openWithSpec.
	
"
Class {
	#name : 'IceTipReadOnlyFormBuilder',
	#superclass : 'Object',
	#instVars : [
		'labelColor',
		'labelWidth',
		'rowHeight',
		'items',
		'spApplication',
		'presenter'
	],
	#category : 'Iceberg-TipUI-Spec2',
	#package : 'Iceberg-TipUI',
	#tag : 'Spec2'
}

{ #category : 'instance creation' }
IceTipReadOnlyFormBuilder class >> newBuiltFor: aDictionary application: aSpApplication [

	"If you want to keep order, just send an OrderedDictionary"

	^ self new
		items: aDictionary;
		application: aSpApplication;
		build
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> application: aSpApplication [ 
	
	spApplication := aSpApplication
]

{ #category : 'building' }
IceTipReadOnlyFormBuilder >> build [

	presenter := spApplication newPresenter: SpPresenter.
	presenter layout: self buildLayout.
	^ presenter
]

{ #category : 'building' }
IceTipReadOnlyFormBuilder >> buildLayout [
	| lastLabel fieldPresenter |
	lastLabel := items associations last key.
	^ SpGridLayout new
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder |
			items keysAndValuesDo: [ :label :value | 
				builder add: (presenter newLabel 
					label: label;
					yourself). 

				fieldPresenter := (label ~= lastLabel) 
					ifTrue: [ presenter newTextInput ]
					ifFalse: [ 
						presenter newText 
							beWrapWord;
							addStyle: 'lines8';
							yourself ].
				
				builder add: (fieldPresenter
					addStyle: 'iceTipReadonly';
					editable: false;
					text: value; 
					yourself).
				
				builder nextRow ] ];
		yourself
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> defaultLabelWidth [

	^ 100 * self currentWorld displayScaleFactor
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> defaultRowHeight [

	^ 30 * self currentWorld displayScaleFactor
]

{ #category : 'initialization' }
IceTipReadOnlyFormBuilder >> initialize [

	items := OrderedDictionary new.
	super initialize
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> items: aDictionary [

	items removeAll.
	items addAll: aDictionary.

]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> labelColor [

	^ labelColor ifNil: [ labelColor := Smalltalk ui theme textColor ]
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> labelColor: aColor [

	^ labelColor := aColor
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> labelWidth [

	^ labelWidth ifNil: [ self defaultLabelWidth ]
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> labelWidth: aNumber [

	^ labelWidth := aNumber
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> rowHeight [

	^ rowHeight ifNil: [ rowHeight := self defaultRowHeight ]
]

{ #category : 'accessing' }
IceTipReadOnlyFormBuilder >> rowHeight: aNumber [

	rowHeight := aNumber
]
