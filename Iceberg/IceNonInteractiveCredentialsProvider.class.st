"
A credentials provider that retrieves defaults or throws exceptions (but do not interacts with the user)
"
Class {
	#name : 'IceNonInteractiveCredentialsProvider',
	#superclass : 'IceCredentialsProvider',
	#category : 'Iceberg-Security',
	#package : 'Iceberg',
	#tag : 'Security'
}

{ #category : 'private' }
IceNonInteractiveCredentialsProvider >> obtainCredentials: response [
	"Maybe I can read a file here?"
	LGitNoCredentialsProvided signal
]

{ #category : 'private' }
IceNonInteractiveCredentialsProvider >> obtainPlaintextCredentials: response [
	"Maybe I can read a file here?"
	LGitNoCredentialsProvided signal
]

{ #category : 'private' }
IceNonInteractiveCredentialsProvider >> obtainSshCredentials: response [
	"Maybe I can read a file here?"
	LGitNoCredentialsProvided signal
]
