module.exports = (config) ->

  config.set

    basePath: './tests/'

    files : [
      '*.coffee'
    ]


    preprocessors:
      '*.coffee' : ['coffee']

    coffeePreprocessor:
      transformPath: (path) ->
        path.replace(/\.coffee$/, '.js')
      options:
        bare: false,
        sourceMap: false


    frameworks: ['jasmine']


    exclude: [
    ],

    reporters: ['progress', 'mocha']

    port: 9876

    colors: true

    logLevel: config.LOG_INFO

    autoWatch: true
    # Chrome or PhantomJS
    browsers: ['PhantomJS']

    captureTimeout: 60000

    singleRun: false

    plugins : [
      'karma-jasmine'
      'karma-phantomjs-launcher'
      'karma-chrome-launcher'
      'karma-coffee-preprocessor'
      'karma-mocha-reporter'
    ]
