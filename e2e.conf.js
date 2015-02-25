/**
 * Created by Mac-Vincent on 25/02/15.
 */
// An example configuration file.
exports.config = {
    directConnect: true,

    seleniumServerJar: '../node_modules/grunt-protractor-runner/node_modules/protractor/selenium/selenium-server-standalone-2.44.0.jar',

    chromeDriver: '../node_modules/grunt-protractor-runner/node_modules/protractor/selenium/chromedriver',
    baseUrl: 9000,
    framework: 'jasmine',
    capabilities: {
        'browserName': 'chrome'
    },

    baseUrl: 'http://localhost:9000/#/main',

    // Spec patterns are relative to the current working directly when
    // protractor is called.
    specs: ['./tests/e2e/spec.js'],

    // Options to be passed to Jasmine-node.
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 30000
    }
};
