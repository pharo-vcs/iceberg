"
I'm a model to present push commits and operations.
"
Class {
	#name : 'IceTipPushModel',
	#superclass : 'IceTipRemoteActionModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipPushModel >> commitModels [

	^ (self entity outgoingCommitsTo: self remote) collect: [ :each |
		  IceTipCommitModel repositoryModel: self repositoryModel on: each ]
]

{ #category : 'actions' }
IceTipPushModel >> needsPush [
	"Pushing nothing still costs a connection to the remote. A tag on the head may be missing in the remote, which cannot be known locally"

	^ (self entity outgoingCommitsTo: self remote) isNotEmpty or: [ self entity branch tags isNotEmpty ]
]

{ #category : 'actions' }
IceTipPushModel >> newPushAction [
	"Announcing refreshes the open browsers, so it runs in the UI process, not in the task"

	^ IceTipBackgroundAction new
		  repository: self entity;
		  title: 'Pushing';
		  operation: #push;
		  action: [
				  self needsPush ifTrue: [ self entity pushTo: self remote ].
				  SpApplication defaultApplication defer: [ Iceberg announcer announce: (IcePushed for: self entity) ] ];
		  yourself
]
