Class {
	#name : #IceTipHiedraAltHistoryRow,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#category : #'Iceberg-TipUI-View-Repository-HiedraAlt'
}

{ #category : #initialization }
IceTipHiedraAltHistoryRow >> addTagsTo: aLayout [
	| tagNames tagLayout |
	
	tagNames := self item tagNames.
	tagNames ifEmpty: [ ^ self ].

	tagLayout := SpBoxLayout newLeftToRight
		spacing: 5;
		yourself.		
	tagNames do: [ :each | 
		tagLayout 
			add: (self newLabel 
				addStyle: 'iceTag';
				label: each;
				displayColor: [ self item tagDecorator color ];
				displayBold: [ self item tagDecorator isBold ];
				displayItalic: [ self item tagDecorator isItalic ];
				yourself)
			expand: false ].
		
	aLayout add: tagLayout expand: false
]

{ #category : #accessing }
IceTipHiedraAltHistoryRow >> form [

	^ self model first
]

{ #category : #initialization }
IceTipHiedraAltHistoryRow >> initializePresenters [

	self layout: (SpBoxLayout newLeftToRight
		spacing: 5;
		add: (SpBoxLayout newLeftToRight
			add: (self newImage image: self form) expand: false;
			in: [ :this | self addTagsTo: this ];
			add: self item shortDescription;
			yourself);
		add: self item author width: 160;  
		add: self item timeStamp asLocalStringYMDHM width: 120; 
		yourself).
]

{ #category : #accessing }
IceTipHiedraAltHistoryRow >> item [

	^ self model second
]
