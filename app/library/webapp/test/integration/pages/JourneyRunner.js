sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"library/test/integration/pages/BooksList.gen",
	"library/test/integration/pages/BooksObjectPage.gen"
], function (JourneyRunner, BooksListGenerated, BooksObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('library') + '/test/flp.html#app-preview',
        pages: {
			onTheBooksListGenerated: BooksListGenerated,
			onTheBooksObjectPageGenerated: BooksObjectPageGenerated
        },
        async: true
    });

    return runner;
});

