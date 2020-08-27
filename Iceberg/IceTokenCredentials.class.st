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
		'token',
		'username'
	],
	#category : #'Iceberg-Security'
}

{ #category : #printing }
IceTokenCredentials >> description [
	^ 'User: ', username
]

{ #category : #printing }
IceTokenCredentials >> hostDescription [
	^ host
]

{ #category : #accessing }
IceTokenCredentials >> isPresent [
	^ self token notEmpty
]

{ #category : #accessing }
IceTokenCredentials >> password [
	"For git operations in GitHub, the token can be used as password.
	
	See https://docs.github.com/en/enterprise/2.15/user/articles/creating-a-personal-access-token-for-the-command-line#using-a-token-on-the-command-line"

	^ token
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

{ #category : #accessing }
IceTokenCredentials >> username [
	^ username
]

{ #category : #accessing }
IceTokenCredentials >> username: aString [
	username := aString
]
