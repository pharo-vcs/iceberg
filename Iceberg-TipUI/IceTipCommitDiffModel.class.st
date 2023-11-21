"
I'm a ""static"" diff. 
I represent a diff between two concrete commits.
"
Class {
	#name : 'IceTipCommitDiffModel',
	#superclass : 'IceTipDiffModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipCommitDiffModel >> diff [
	^ self entity
]
