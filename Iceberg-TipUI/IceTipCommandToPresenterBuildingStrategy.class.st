"
I'm an abstract strategy to build Spec2 buttons wrapping a IceTipSpCommand. My concrete subclasses do this with specific characteristics.


"
Class {
	#name : #IceTipCommandToPresenterBuildingStrategy,
	#superclass : #Object,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #hook }
IceTipCommandToPresenterBuildingStrategy >> buttonPresenterClass [

	^ self subclassResponsibility
]

{ #category : #public }
IceTipCommandToPresenterBuildingStrategy >> resultOn: aCommand [

	^ self buttonPresenterClass new
		label: aCommand name;
		help: aCommand description;
		in: [ :button | 
			aCommand hasIcon
				ifTrue: [ button icon: aCommand icon ] ];
		action: [ aCommand execute ];
		yourself

]
