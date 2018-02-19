accessing
info
	^ { 'Commit:' -> ('[', self entity shortId, '] ', self entity id).
		 'Parents:' -> (self entity ancestors collect: #shortId) asCommaString.
		 'Author:' -> (self entity author).
		 'Date:' -> (self entity timeStamp asStringYMDHM).
		 'Labels:' -> 'TODO'.
	    'Comment:' -> self entity comment }