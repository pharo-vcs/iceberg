Class {
	#name : #IceTipRemovePackageDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'model',
		'iconPanel',
		'confirmLabel',
		'removeFromRepositoryCheckbox',
		'unloadFromImageCheckbox'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #accessing }
IceTipRemovePackageDialog class >> confirmMessage [
	^ 'Are you sure to remove package {1}?'
]

{ #category : #specs }
IceTipRemovePackageDialog class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #iconPanel width: 40 * self currentWorld displayScaleFactor;
				add:
					(SpBoxLayout newVertical
						add: #confirmLabel;
						add: #unloadFromImageCheckbox height: self inputTextHeight;
						add: #removeFromRepositoryCheckbox height: self inputTextHeight;
						yourself);
						yourself );
						yourself 
]

{ #category : #specs }
IceTipRemovePackageDialog class >> title [
	^ 'Remove Package'
]

{ #category : #actions }
IceTipRemovePackageDialog >> accept [
	self removeFromRepositoryCheckbox state
		ifTrue: [ self model remove ].
	self unloadFromImageCheckbox state
		ifTrue: [ self model unload ].
]

{ #category : #'accessing ui' }
IceTipRemovePackageDialog >> confirmLabel [
	^ confirmLabel
]

{ #category : #'accessing ui' }
IceTipRemovePackageDialog >> confirmLabel: anObject [
	confirmLabel := anObject
]

{ #category : #'accessing ui' }
IceTipRemovePackageDialog >> iconPanel [
	^ iconPanel
]

{ #category : #'accessing ui' }
IceTipRemovePackageDialog >> iconPanel: anObject [
	iconPanel := anObject
]

{ #category : #accessing }
IceTipRemovePackageDialog >> initialExtent [
	^ (500
		@ (self class inputTextHeight * 2 + self class buttonHeight + 75))
		scaledByDisplayScaleFactor	"Yes, a magic number"
]

{ #category : #initialization }
IceTipRemovePackageDialog >> initializeWidgets [
	iconPanel := self newImage.
	iconPanel image: (self iconNamed: #question).
	
	confirmLabel := self newLabel 
		label: (self class confirmMessage format: { self model name }).
	unloadFromImageCheckbox := self newCheckBox
		label: 'Unload from image';
		state: true.
	removeFromRepositoryCheckbox := self newCheckBox
		label: 'Remove from repository';
		state: true.

	self focusOrder 
		add: unloadFromImageCheckbox;
		add: removeFromRepositoryCheckbox
]

{ #category : #accessing }
IceTipRemovePackageDialog >> model [
	^ model
]

{ #category : #accessing }
IceTipRemovePackageDialog >> model: anObject [
	model := anObject
]

{ #category : #accessing }
IceTipRemovePackageDialog >> removeFromRepositoryCheckbox [
	^ removeFromRepositoryCheckbox
]

{ #category : #accessing }
IceTipRemovePackageDialog >> removeFromRepositoryCheckbox: anObject [
	removeFromRepositoryCheckbox := anObject
]

{ #category : #initialization }
IceTipRemovePackageDialog >> setModelBeforeInitialization: anObject [ 
	model := anObject
]

{ #category : #accessing }
IceTipRemovePackageDialog >> unloadFromImageCheckbox [
	^ unloadFromImageCheckbox
]

{ #category : #accessing }
IceTipRemovePackageDialog >> unloadFromImageCheckbox: anObject [
	unloadFromImageCheckbox := anObject
]
