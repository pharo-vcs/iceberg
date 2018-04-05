accessing
info 
	^ { 
		'Branch' -> self entity branch name.
		'Location' -> self entity location pathString.
		'Upstream' -> self entity upstream asString.
	  }