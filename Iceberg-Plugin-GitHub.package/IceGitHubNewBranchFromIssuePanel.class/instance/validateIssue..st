private
validateIssue: aString
	| number remote |

	fetched := false.
	aString trimmed isEmpty ifTrue: [ ^ self ].
	aString isAllDigits ifFalse: [ ^ self ].
	number := aString asNumber.
	(issue isNil or: [ (issue at: 'number') ~= number ]) ifFalse: [ ^ self ].
	remote := self selectRemoteModel remote.
	
	[ 	"Fork to allow UI to continue"
		issue := IceGitHubAPI new 
			beAnonymous;
			getIssue: remote owner 
				project: remote projectName 
				number: number.
		UIManager default defer: [ 
			self updateText: (self sanitizeTitle: (issue at: 'title')) ] ] fork