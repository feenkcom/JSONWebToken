initialization
initializePageReviews
	pageReviews := self reviewKb pagesByName values
			collect: [ :p | PageReview for: p in: self ]