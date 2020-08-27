"
I implement authentication credentials via OAUTH-like token.

## Examples

* https://developer.github.com/v3/#authentication
* https://confluence.atlassian.com/bitbucketserver0514/using-bitbucket-server/personal-access-tokens

"
Class {
	#name : #IceTokenCredentials,
	#superclass : #IceAbstractCredentials,
	#instVars : [
		'token'
	],
	#category : #'Iceberg-Security'
}

{ #category : #printing }
IceTokenCredentials >> description [
	^ ''
]

{ #category : #printing }
IceTokenCredentials >> hostDescription [
	^ host
]

{ #category : #accessing }
IceTokenCredentials >> isPresent [
	^ self token notEmpty
]

{ #category : #removing }
IceTokenCredentials >> removeFrom: anIceCredentialStore [ 

	anIceCredentialStore removePlainTextCredential: self
]

{ #category : #accessing }
IceTokenCredentials >> token [

	^ token
]

{ #category : #accessing }
IceTokenCredentials >> token: aString [

	token := aString
]

{ #category : #accessing }
IceTokenCredentials >> type [

	^ 'Token'
]
