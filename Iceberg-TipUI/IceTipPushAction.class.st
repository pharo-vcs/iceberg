"
I perform a push.
"
Class {
	#name : 'IceTipPushAction',
	#superclass : 'IceTipAction',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'executing' }
IceTipPushAction >> basicExecute [
	
	context application
		informUser: 'Pushing...' 
		during: [ self repository push ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
	Iceberg announcer announce: (IcePushed for: self repository).
]
