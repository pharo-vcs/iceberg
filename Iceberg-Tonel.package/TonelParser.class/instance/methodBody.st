parsing
methodBody
	"I read a methodbody (what is inside [ ... ])
	 Since a method body can contain enclosing brackets we need to be sure we will skip them and
	 correctly read the method. For that, I have to take into account: 
		- I can mention [] in comments
		- I can mention [] in strings
		- I can use $[, $] 
		- I can have inner blocks
		- I can mention a comment of the form ""$"" or a comment of the form '$'
	 all that needs to be skipped "
	| result char prevChar comment string count |
	
	result := String new writeStream.

	comment := false.
	string := false.
	prevChar := nil.
	count := 0.
	stream peek = $[ ifFalse: [ TonelParseError signal: 'Can''t parse method body' ].
	[ stream atEnd not ]
	whileTrue: [ 
		char := stream next.
		result nextPut: char.
		(char = $" and: [ string not and: [ prevChar ~= $$ or: [ comment ] ] ]) 
			ifTrue: [ comment := comment not ]. 
		(char = $' and: [ comment not and: [ prevChar ~= $$ or: [ string ] ] ]) 
			ifTrue: [ string := string not ]. 
		(comment or: [ string ]) ifFalse: [ 
			(char = $[ and: [  prevChar ~= $$ ]) ifTrue: [ count := count +1 ].
			(char = $] and: [ prevChar ~= $$ ]) ifTrue: [ count := count -1 ] ].
		count = 0 ifTrue: [ 
			^ self 
				removeFrom: result contents 
				enclosingStart: $[ 
				end: $]
				clean: #right ].
		prevChar := char ].

	TonelParseError signal: 'Can''t parse method body'