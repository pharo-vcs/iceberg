accessing
info
	^ {('Commit:' -> ('[' , self shortId , '] ' , self id)).
	('Parents:' -> (self entity ancestors collect: #shortId) asCommaString).
	('Author:' -> self entity author).
	('Date:' -> self entity timeStamp asStringYMDHM).
	('Tags:' -> self entity tagNames asCommaString).
	('Comment:' -> self entity comment)}