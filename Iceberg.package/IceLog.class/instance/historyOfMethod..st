accessing
historyOfMethod: aMethod
	| path commits |

	path := self toFileName: aMethod.
	commits := self collectCommitsFor: aMethod path: path.
	
	^ self 
		collectVersionsFrom: commits 
		method: aMethod 
		path: path