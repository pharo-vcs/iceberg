private
retrieveHistory
	UIManager default 
		informUser: ('Retrieving history of {1}' format: { self method printString }) 
		during: [ ^ self repository log historyOfMethod: self method	]