accessing
badgeFont
	^ badgeFont ifNil: [ badgeFont := self newBadgeFont ]