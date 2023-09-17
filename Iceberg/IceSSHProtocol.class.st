Class {
	#name : 'IceSSHProtocol',
	#superclass : 'IceUrlProtocol',
	#category : 'Iceberg-Url',
	#package : 'Iceberg',
	#tag : 'Url'
}

{ #category : 'accessing' }
IceSSHProtocol class >> description [
	
	^ 'SSH'
]

{ #category : 'url' }
IceSSHProtocol >> composeUrlWithHost: host repositoryPath: path [
	
	^ 'git@{1}:{2}.git' format: { host . path }
]
