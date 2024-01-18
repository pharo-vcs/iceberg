"
I am a credential provider that requires the missing plaintext credential to the user.
"
Class {
	#name : 'IceTipInteractiveCredentialsProvider',
	#superclass : 'IceCredentialsProvider',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'class initialization' }
IceTipInteractiveCredentialsProvider class >> initialize [

	self providerType: nil
]

{ #category : 'private' }
IceTipInteractiveCredentialsProvider class >> isDefault [
	^ true
]

{ #category : 'private' }
IceTipInteractiveCredentialsProvider >> obtainCredentials: credentialsToReturn [
	| returnedCred |

	returnedCred := credentialsToReturn askForModelClass new
		credentialStore: self credentialStore;
		askingHostname: remote host;
		open.

	credentialsToReturn readFrom: returnedCred
]

{ #category : 'private' }
IceTipInteractiveCredentialsProvider >> obtainPlaintextCredentials: credentialsToReturn [
	| returnedCred |
	
	returnedCred := (credentialsToReturn askForModelClassOn: remote host) new
		askingHostname: remote host;
		credentialStore: self credentialStore;		
		openModal;
		credentials.

	credentialsToReturn readFrom: returnedCred
]

{ #category : 'private' }
IceTipInteractiveCredentialsProvider >> obtainSshCredentials: credentialsToReturn [ 
	
	| returnedCred |
	
	returnedCred := IceTipAskSSHCredentialsPresenter new
		credentials: self sshCredentials;
		credentialStore: self credentialStore;
		open.

	credentialsToReturn readFrom: returnedCred
]
