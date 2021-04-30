Class {
	#name : #IceTipTreeExpandCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipTreeExpandCommand class >> defaultDescription [

	^ 'Expand selected item'
]

{ #category : #accessing }
IceTipTreeExpandCommand class >> defaultName [

	^ 'Expand'
]

{ #category : #execution }
IceTipTreeExpandCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #execution }
IceTipTreeExpandCommand >> execute [

	self context doExpandSelection
]

{ #category : #accessing }
IceTipTreeExpandCommand >> iconName [

	^ nil
]

{ #category : #accessing }
IceTipTreeExpandCommand >> shortcutKey [

	^ Character arrowRight asKeyCombination
]
