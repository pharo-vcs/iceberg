private
retrieveHistory
	UIManager default 
		informUser: ('Retrieving history of {1}' format: { self entity printString }) 
		during: [ ^ self repositoryModel entity log historyOfMethod: self entity ]