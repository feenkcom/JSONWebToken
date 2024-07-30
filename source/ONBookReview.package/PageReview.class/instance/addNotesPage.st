accessing
addNotesPage
	| notePage notePageTitle |
	self
		assert: self notes isNil
		description: 'There already is a notes page for this review.'.
	notePageTitle := 'Review notes for ''' , self page title , ''''.
	notePage := LePage named: notePageTitle.
	(self notesKb hasPageNamed: notePageTitle)
		ifTrue: [ self notes: (self notesKb pageNamed: notePageTitle).
			^ self ].
	notePage
		addFirstSnippet: (LeTextSnippet new
				string: self bookReview pageReviewTemplate;
				yourself).
	notePage
		addSnippet: (LeTextSnippet new
				string: 'Notes for: ' , self page asRemoteLink;
				yourself).
	self notesKb addPage: notePage.
	self notes: notePage