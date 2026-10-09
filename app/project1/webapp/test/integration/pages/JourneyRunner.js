sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/BooksList.gen",
	"project1/test/integration/pages/BooksObjectPage.gen",
	"project1/test/integration/pages/ChaptersObjectPage.gen"
], function (JourneyRunner, BooksListGenerated, BooksObjectPageGenerated, ChaptersObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheBooksListGenerated: BooksListGenerated,
			onTheBooksObjectPageGenerated: BooksObjectPageGenerated,
			onTheChaptersObjectPageGenerated: ChaptersObjectPageGenerated
        },
        async: true
    });

    return runner;
});

