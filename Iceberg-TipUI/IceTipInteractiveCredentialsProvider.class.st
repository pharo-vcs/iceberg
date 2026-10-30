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

{ #category : 'accessing' }
IceTipInteractiveCredentialsProvider >> obtainCredentials: credentialsToReturn [

	self onUIProcessDo: [
			| returnedCred |
			returnedCred := credentialsToReturn askForModelClass new
				                credentialStore: self credentialStore;
				                askingHostname: remote host;
				                open.
			credentialsToReturn readFrom: returnedCred ]
]

{ #category : 'accessing' }
IceTipInteractiveCredentialsProvider >> obtainPlaintextCredentials: credentialsToReturn [

	self onUIProcessDo: [
			| returnedCred |
			returnedCred := (credentialsToReturn askForModelClassOn: remote host) new
				                askingHostname: remote host;
				                credentialStore: self credentialStore;
				                openModal;
				                credentials.
			credentialsToReturn readFrom: returnedCred ]
]

{ #category : 'accessing' }
IceTipInteractiveCredentialsProvider >> obtainSshCredentials: credentialsToReturn [

	self onUIProcessDo: [
			| returnedCred |
			returnedCred := IceTipAskSSHCredentialsPresenter new
				                credentials: self sshCredentials;
				                credentialStore: self credentialStore;
				                open.
			credentialsToReturn readFrom: returnedCred ]
]

{ #category : 'private' }
IceTipInteractiveCredentialsProvider >> onUIProcessDo: aBlock [
	"Credentials can be requested from a background task: it waits here while the dialog runs in the UI process"

	| answered failure |
	UIManager default uiProcess == Processor activeProcess ifTrue: [ ^ aBlock value ].
	answered := Semaphore new.
	SpApplication defaultApplication defer: [
			[
				[ aBlock value ]
					on: Exception
					do: [ :anException | failure := anException ] ] ensure: [ answered signal ] ].
	answered wait.
	failure ifNotNil: [ failure signal ]
]
