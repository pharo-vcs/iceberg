events
changed

	current >= max ifTrue: [ ^ Job jobAnnouncer announce: (JobEnd on: self) ].
	Job jobAnnouncer announce: (JobChange on: self)