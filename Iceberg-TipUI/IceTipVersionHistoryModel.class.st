"
I'm a model to provide the history of a method.
"
Class {
	#name : 'IceTipVersionHistoryModel',
	#superclass : 'IceTipCommitishModel',
	#instVars : [
		'commitModels'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipVersionHistoryModel >> commitModelAfter: aModel [
	^ self commitModels 
		after: aModel
		ifAbsent: [ nil ]
]

{ #category : 'accessing' }
IceTipVersionHistoryModel >> commitModels [

	^ commitModels ifNil: [
		  commitModels := self retrieveHistory collect: [ :each |
			                  IceTipVersionModel
				                  repositoryModel: self repositoryModel
				                  on: each ] ]
]

{ #category : 'accessing' }
IceTipVersionHistoryModel >> description [

	^ self name
]

{ #category : 'accessing' }
IceTipVersionHistoryModel >> name [
	^ '{1}>>{2}' format: { self entity origin name. self entity selector }
]

{ #category : 'private' }
IceTipVersionHistoryModel >> retrieveHistory [
	| history |

	self repositoryModel checkMissing.
	^self application 
		informUser: ('Retrieving history of {1}' format: { self entity printString }) 
		during: [ history := self repositoryModel entity log historyOfMethod: self entity ].
	^ history
]
