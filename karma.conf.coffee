module.exports = (config) ->

  config.set

    basePath: './tests/'

    files: [
      'app.js', 'test.js'
    ]

    frameworks: ['jasmine']


    exclude: [
    ],

    reporters: ['progress']

    port: 9876

    colors: true

    logLevel: config.LOG_INFO

    autoWatch: true

    browsers: ['Chrome', 'phantomjs']

    captureTimeout: 60000

    singleRun: false

    plugins : ['karma-jasmine', 'karma-phantomjs-launcher', 'karma-chrome-launcher']
