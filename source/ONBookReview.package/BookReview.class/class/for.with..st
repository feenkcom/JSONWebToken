instance creation
for: aReviewKbName with: aNotesKbName
	^ self new
		initializeReviewKbName: aReviewKbName;
		initializeNotesKbName: aNotesKbName;
		initializePageReviews;
		yourself