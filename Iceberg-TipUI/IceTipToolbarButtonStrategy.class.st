Class {
	#name : #IceTipToolbarButtonStrategy,
	#superclass : #IceTipCommandToPresenterBuildingStrategy,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #hook }
IceTipToolbarButtonStrategy >> buttonPresenterClass [

	^ SpToolbarButtonPresenter
]

{ #category : #public }
IceTipToolbarButtonStrategy >> resultOn: aCommand [

	| aButtonPresenter |
	aButtonPresenter := super resultOn: aCommand.


	aButtonPresenter label: aCommand toolbarItemName.

	aButtonPresenter badge: aCommand decoratedCommand badge.

	^ aButtonPresenter

]
