Class {
	#name : #IceTipCommitSettings,
	#superclass : #Object,
	#classVars : [
		'pushOnCommit',
		'saveImageOnCommit'
	],
	#classInstVars : [
		'pushOnCommit'
	],
	#category : #Iceberg
}

{ #category : #accessing }
IceTipCommitSettings class >> pushOnCommit [
	^ pushOnCommit ifNil: [ pushOnCommit := false ]
]

{ #category : #accessing }
IceTipCommitSettings class >> pushOnCommit: aBoolean [
	pushOnCommit := aBoolean 
]

{ #category : #accessing }
IceTipCommitSettings class >> saveImageOnCommit [
	^ saveImageOnCommit ifNil: [ saveImageOnCommit := true ]
]

{ #category : #accessing }
IceTipCommitSettings class >> saveImageOnCommit: aBoolean [
	saveImageOnCommit := aBoolean 
]

{ #category : #settings }
IceTipCommitSettings class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #commitPreferences)
		parent: #Iceberg;
		noOrdering;
		target: self;
		label: 'Commit action settings';
		description: 'Chose the behavior when you commit something';
		with: [ (aBuilder setting: #saveImageOnCommit)
				noOrdering;
				target: self;
				label: 'Save the image when commiting';
				description: 'Check if you want to save the image each time you commit something'.
			(aBuilder setting: #pushOnCommit)
				noOrdering;
				target: self;
				label: 'Push when commiting';
				description:
					'Check if you want to push your changes each time you commit something'. ]
]
