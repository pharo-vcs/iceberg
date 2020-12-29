"
I'm a command to remove branches from remotes.
"
Class {
	#name : #IceGitHubTreeRemoveBranchesCommand,
	#superclass : #IceGitHubTreeCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceGitHubTreeRemoveBranchesCommand class >> defaultName [

	^ 'Remove Remote Branches'
]

{ #category : #accessing }
IceGitHubTreeRemoveBranchesCommand >> execute [

	^ IceGitHubRemoveBranchesAction new
		  repository: self repository;
		  remote: self remote;
		  execute
]
