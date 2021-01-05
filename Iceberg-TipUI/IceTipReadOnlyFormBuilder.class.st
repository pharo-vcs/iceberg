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
	#name : #IceTipReadOnlyFormBuilder,
	#superclass : #Object,
	#instVars : [
		'labelColor',
		'labelWidth',
		'rowHeight',
		'items'
	],
	#category : #'Iceberg-TipUI-Spec2'
}

{ #category : #'instance creation' }
IceTipReadOnlyFormBuilder class >> newBuiltFor: aDictionary [
	"If you want to keep order, just send an OrderedDictionary"

	^ self new items: aDictionary; newPresenter
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> addLabel: aString value: anObject [

	items at: aString put: anObject.
	self refresh
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> defaultLabelWidth [

	^ 100 * self currentWorld displayScaleFactor
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> defaultRowHeight [

	^ 25 * self currentWorld displayScaleFactor
]

{ #category : #initialization }
IceTipReadOnlyFormBuilder >> initialize [

	items := OrderedDictionary new.
	super initialize
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> items: aDictionary [

	items removeAll.
	items addAll: aDictionary.

]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> labelColor [

	^ labelColor ifNil: [ labelColor := Smalltalk ui theme textColor ]
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> labelColor: aColor [

	^ labelColor := aColor
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> labelWidth [

	^ labelWidth ifNil: [ self defaultLabelWidth ]
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> labelWidth: aNumber [

	^ labelWidth := aNumber
]

{ #category : #'private factory' }
IceTipReadOnlyFormBuilder >> newLayout [

	| newLayout |
	newLayout := SpBoxLayout newVertical.

	items keysAndValuesDo: [ :label :value | 
		newLayout
			add: (self newRowPresenterForLabel: label value: value)
			height: self rowHeight ].

	^ newLayout
]

{ #category : #'private factory' }
IceTipReadOnlyFormBuilder >> newPresenter [

	^ SpPresenter new
		  layout: self newLayout;
		  yourself
]

{ #category : #'private factory' }
IceTipReadOnlyFormBuilder >> newRowPresenterForLabel: aString value: anotherString [

	^ SpBoxLayout newHorizontal
		  add: (SpLabelPresenter new
				   label: aString;
				   color: self labelColor;
				   yourself)
		  width: self labelWidth;
		  add: (SpLabelPresenter new
				   label: anotherString;
				   yourself);
		  yourself
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> rowHeight [

	^ rowHeight ifNil: [ rowHeight := self defaultRowHeight ]
]

{ #category : #accessing }
IceTipReadOnlyFormBuilder >> rowHeight: aNumber [

	rowHeight := aNumber
]
