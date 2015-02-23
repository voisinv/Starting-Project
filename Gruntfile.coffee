# * matches any number of characters, but not /
# ? matches a signle character, but not /
# ** matches any number of characters, including /,
# as long as it's only thing in a path part
# {} allows for a comma-separated list of "or" expressions
# ! at the beginning of a pattern will negate the match

module.exports = (grunt) ->

  resources = grunt.file.readJSON 'resources.json'

  grunt.initConfig

    pkg : grunt.file.readJSON 'package.json'

    jade:
      html:
        files: {
          './app/' : './dev/index.jade'
        }
        options:
          pretty: true
          client: false
          wrap: false
          compileDebug: true
      base_path: {
        files: {
          'app/partials/' : ['dev/partials/{,*/}*.jade']
        },
        options: {
          pretty: true
          client: false
          compileDebug: true
          basePath: './dev/partials/'
        }
      }
    copy :
      main :
        files :[
          {
            expand:true
            cwd: resources.dev.assets
            src: ['**', '**/*.css']
            dest: resources.app.assets
          }
          ]

    connect:
      options:
        hostname: 'localhost'
        livereload: 35729
        port: 3000
      server:
        options:
          base: ['./app', './']
          open: true

    fileblocks:
      todos:
        src:'./app/index.html'
        blocks:
          app:
            src:resources.app.scripts + '{,*/}*.js'

    watch:
      all:
        files: [
          'Gruntfile.coffee'
          'dev/*.*'
          'dev/**/{,*/}*.*'
        ]
        tasks : [
          'jade:html'
          'jade:base_path'
          'wiredep'
          'coffee'
          'fileblocks'
        ]
      options:
        livereload: '<%= connect.options.livereload %>'
        reload: false
        debounceDelay: 10

    coffee:
      glob_to_multiple:
        expand: true
        bare: true
        flatten: false
        cwd: resources.dev.scripts
        src: '{,*/}*.coffee'
        dest: resources.app.scripts
        ext: '.js'

    wiredep:
      task:
        src: resources.app.index




  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-wiredep'
  grunt.loadNpmTasks 'grunt-file-blocks'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-jade'

  grunt.registerTask 'jade2', ['jade:debug']

  grunt.registerTask 'serve', () ->
    if grunt.option 'build'
      grunt.log.ok 'Mode build'
      grunt.run.task 'buildMode'
    else
      grunt.log.ok 'Mode développement'
      grunt.task.run 'devMode'


  grunt.registerTask 'devMode', ->
    grunt.task.run 'connect:server'
    grunt.task.run 'watch:all'

  grunt.registerTask 'buildMode', ->

  grunt.registerTask 'copyy', ->
    grunt.task.run 'copy:main'
    console.log @name

  grunt.registerTask 'tasktest', ->
    grunt.task.run ['jade:html', 'jade:base_path']

