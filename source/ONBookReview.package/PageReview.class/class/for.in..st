instace creation
for: aLePage in: aBookReview
	^ self new
		page: aLePage;
		bookReview: aBookReview;
		initializeStatus;
		yourself