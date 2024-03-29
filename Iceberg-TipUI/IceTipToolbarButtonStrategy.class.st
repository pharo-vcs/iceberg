"
I'm a strategy to build Spec2 buttons foro a toolar wrapping a IceTipSpCommand.

"
Class {
	#name : 'IceTipToolbarButtonStrategy',
	#superclass : 'IceTipCommandToPresenterBuildingStrategy',
	#category : 'Iceberg-TipUI-Spec2',
	#package : 'Iceberg-TipUI',
	#tag : 'Spec2'
}

{ #category : 'hook' }
IceTipToolbarButtonStrategy >> buttonPresenterClass [

	^ SpToolbarButtonPresenter
]

{ #category : 'public' }
IceTipToolbarButtonStrategy >> resultOn: aCommand [

	| aButtonPresenter |
	aButtonPresenter := super resultOn: aCommand.

	aButtonPresenter
		label: aCommand toolbarItemName;
		badge: aCommand decoratedCommand badge.

	^ aButtonPresenter

]
