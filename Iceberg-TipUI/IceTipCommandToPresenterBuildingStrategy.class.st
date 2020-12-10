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
