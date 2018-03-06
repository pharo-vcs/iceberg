accessing
badge
	badgeSelector ifNil: [ ^ nil ].
	^ self model perform: badgeSelector