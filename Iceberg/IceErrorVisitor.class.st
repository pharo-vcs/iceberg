"
I'm a generic visitor for IceError instances. My subclasses can override my methods to specialize handling.
"
Class {
	#name : 'IceErrorVisitor',
	#superclass : 'Object',
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'visiting' }
IceErrorVisitor >> visitAuthenticationError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitCheckoutConflict: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitCloneLocationAlreadyExists: anError [ 
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitCloneRemoteNotFound: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitGenericError: anError [
	"Just re-send as default (to have a debugger)"
	anError pass
]

{ #category : 'visiting' }
IceErrorVisitor >> visitMergeAborted: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitMissingCredentialsError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitNoRemote: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitNothingToCommitError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitRemoteAlreadyExistError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitRemoteDesynchronizedError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitShouldCommitBeforePullError: anError [
	self visitGenericError: anError
]

{ #category : 'visiting' }
IceErrorVisitor >> visitWorkingCopyDesynchronizedError: anError [
	self visitGenericError: anError
]
