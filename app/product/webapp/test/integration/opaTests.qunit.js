sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/product/test/integration/FirstJourney',
		'ns/product/test/integration/pages/productList',
		'ns/product/test/integration/pages/productObjectPage'
    ],
    function(JourneyRunner, opaJourney, productList, productObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/product') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheproductList: productList,
					onTheproductObjectPage: productObjectPage
                }
            },
            opaJourney.run
        );
    }
);