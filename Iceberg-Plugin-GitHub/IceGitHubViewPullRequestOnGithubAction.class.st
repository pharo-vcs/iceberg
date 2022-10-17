Class {
	#name : #IceGitHubViewPullRequestOnGithubAction,
	#superclass : #IceGitHubAction,
	#instVars : [
		'organisation',
		'projectName'
	],
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #'instance creation' }
IceGitHubViewPullRequestOnGithubAction class >> organisation: aString projectName: anotherString [
	^ self new
		organisation: aString;
		projectName: anotherString;
		yourself
]

{ #category : #executing }
IceGitHubViewPullRequestOnGithubAction >> basicExecute [
	[ 
	
	| url |
	url := (self github getRepository: self organisation project: self projectName) at: 'html_url'.
	
	self class environment 
		at: #WebBrowser 
		ifPresent: [ :webBrowser | webBrowser openOn: url ] 
		ifAbsent: [ 
			UIManager default inform: ('Cannot open "{1}" because the project WebBrowser is not present by default in Pharo 6.' format: { url }) ] 
	
	]
		on: IceGitHubError
		do: [ 
			UIManager default inform: ('Invalid Github repository. No project named "{1}" found for the owner "{2}"' 
				format: {
					self projectName. 
					self organisation}) ]
]

{ #category : #accessing }
IceGitHubViewPullRequestOnGithubAction >> organisation [
	^ organisation
]

{ #category : #accessing }
IceGitHubViewPullRequestOnGithubAction >> organisation: anObject [
	organisation := anObject
]

{ #category : #accessing }
IceGitHubViewPullRequestOnGithubAction >> projectName [
	^ projectName
]

{ #category : #accessing }
IceGitHubViewPullRequestOnGithubAction >> projectName: anObject [
	projectName := anObject
]
