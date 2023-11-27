Class {
	#name : 'IceGitHubViewPullRequestOnGithubAction',
	#superclass : 'IceGitHubAction',
	#instVars : [
		'organisation',
		'projectName'
	],
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'instance creation' }
IceGitHubViewPullRequestOnGithubAction class >> organisation: aString projectName: anotherString [
	^ self new
		organisation: aString;
		projectName: anotherString;
		yourself
]

{ #category : 'executing' }
IceGitHubViewPullRequestOnGithubAction >> basicExecute [

	[
	| url |
	url := (self github
		        getRepository: self organisation
		        project: self projectName) at: 'html_url'.

	self class environment
		at: #WebBrowser
		ifPresent: [ :webBrowser | webBrowser openOn: url ]
		ifAbsent: [
			self application newInform
				title: ('Cannot open "{1}"' format: { url });
				label:
					'Because the project WebBrowser is not present by default in Pharo 6.';
				openModal ] ]
		on: IceGitHubError
		do: [
			self application newInform
				title: 'Invalid Github repository.';
				label:
					('No project named "{1}" found for the owner "{2}"' format: {
								 self projectName.
								 self organisation });
				openModal ]
]

{ #category : 'accessing' }
IceGitHubViewPullRequestOnGithubAction >> organisation [
	^ organisation
]

{ #category : 'accessing' }
IceGitHubViewPullRequestOnGithubAction >> organisation: anObject [
	organisation := anObject
]

{ #category : 'accessing' }
IceGitHubViewPullRequestOnGithubAction >> projectName [
	^ projectName
]

{ #category : 'accessing' }
IceGitHubViewPullRequestOnGithubAction >> projectName: anObject [
	projectName := anObject
]
