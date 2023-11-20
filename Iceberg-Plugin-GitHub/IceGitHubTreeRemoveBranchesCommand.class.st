"
I'm a command to remove branches from remotes.
"
Class {
	#name : 'IceGitHubTreeRemoveBranchesCommand',
	#superclass : 'IceGitHubTreeCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubTreeRemoveBranchesCommand class >> defaultName [

	^ 'Remove Remote Branches'
]

{ #category : 'executing' }
IceGitHubTreeRemoveBranchesCommand >> execute [

	^ IceGitHubRemoveBranchesAction new
		repository: self repository;
		remote: self remote;
		executeWithContext: context
]
