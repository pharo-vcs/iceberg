"
I'm a SpToolbarPresenterBuilder that delegates to the command the decision to actually add a button to represent it.

"
Class {
	#name : 'IceTipToolbarPresenterBuilder',
	#superclass : 'SpToolbarPresenterBuilder',
	#category : 'Iceberg-TipUI-Spec2',
	#package : 'Iceberg-TipUI',
	#tag : 'Spec2'
}

{ #category : 'visiting' }
IceTipToolbarPresenterBuilder >> visitCommand: anEntry [

	anEntry ifVisible: [ super visitCommand: anEntry ]
]
