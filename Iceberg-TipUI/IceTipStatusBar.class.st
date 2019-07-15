"
I'm a status bar to be added at the bottom of a window. 
I have items inside, but the items itself can be anything you want (text, icons, buttons, etc).
"
Class {
	#name : #IceTipStatusBar,
	#superclass : #IceTipItemBar,
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #accessing }
IceTipStatusBar class >> defaultItemSeparation [
	^ 0
]

{ #category : #'private dispatch' }
IceTipStatusBar >> addItemLeft: aMorph [
	self leftPanel addMorphBack: (self prepareItemToAdd: aMorph)
]

{ #category : #'private dispatch' }
IceTipStatusBar >> addItemRight: aMorph [
	self rightPanel addMorphBack: (self prepareItemToAdd: aMorph)
]

{ #category : #private }
IceTipStatusBar >> prepareItemToAdd: aMorph [
	^ aMorph
		vResizing: #spaceFill;
		yourself
]
