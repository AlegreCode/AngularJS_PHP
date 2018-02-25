module.exports = function(grunt) {
    //carga todas la dependencias de grunt
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        copy: {
            main: {
                expand: true,
                cwd: 'src/',
                src: ["**", "!**/templates/**", "!**/*.pug", "!css/**/*.scss", "!css/**/_partials", "!js/**/*.coffee", "!**/modules/**", "!**/img/**", "!**/coffeescript/**", "!**/scss/**", "!**/pug/**"],
                dest: 'dist/'
            }
        },
        pug: {
            compile: {
                options: {
                    pretty: true,
                    data: {
                        debug: false
                    }
                },
                files: [{
                        expand: true,
                        cwd: "src/pug/",
                        src: ["*.pug"],
                        dest: "src/",
                        ext: ".html"
                    },
                    {
                        expand: true,
                        cwd: "src/pug/views/",
                        src: ["*.pug"],
                        dest: "src/views",
                        ext: ".html"
                    }
                ]
            }
        },
        sass: {
            dist: {
                options: {
                    style: 'expanded',
                    noCache: true,
                    sourcemap: 'none'
                },
                files: [{
                    expand: true,
                    cwd: "src/scss",
                    src: ["*.scss"],
                    dest: "src/css",
                    ext: ".css"
                }]
            }
        },
        postcss: {
            options: {
                processors: [
                    require('autoprefixer')({ browsers: ['last 5 version'] })
                ]
            },
            dist: {
                src: 'src/css/*.css'
            }
        },
        cssnano: {
            options: {
                sourcemap: false
            },
            dist: {
                files: [{
                    expand: true,
                    cwd: "src/css",
                    src: ["**/*.css"],
                    dest: "src/css",
                    ext: ".min.css"
                }]
            }
        },
        browserify: {
            dist: {
                files: [{
                    expand: true,
                    cwd: "src/coffeescript",
                    src: ["**/*.coffee", "!**/modules/**"],
                    dest: "src/js",
                    ext: ".js"
                }],
                options: {
                    transform: ['coffeeify']
                }
            }
        },
        uglify: {
            my_target: {
                files: [{
                    expand: true,
                    cwd: "src/js/",
                    src: ["**/*.js", "!**/*.min.js"],
                    dest: "src/js/",
                    ext: ".min.js"
                }]
            }
        },
        imagemin: {
            main: {
                static: {
                    options: {
                        optimizationLevel: 7
                    }
                },
                files: [{
                    expand: true,
                    cwd: "src/img/",
                    src: ["**/*.{png,jpg,gif,svg,ico}"],
                    dest: "dist/img/"
                }]
            }
        },
        compress: {
            main: {
                options: {
                    archive: "archive.zip"
                },
                files: [{
                    expand: true,
                    cwd: "dist/",
                    src: ["**/*"],
                    dest: "./"
                }]
            }
        },
        watch: {
            options: {
                nospawn: true,
                livereload: true
            },
            pug: {
                files: ['src/**/*.pug'],
                tasks: ['pug']
            },
            sass: {
                files: ['src/scss/**/*.scss'],
                tasks: ['sass', 'postcss', 'cssnano']
            },
            browserify: {
                files: ['src/coffeescript/**/*.coffee'],
                tasks: ['browserify', 'uglify']
            },
            images: {
                files: ["src/img/*.{png,jpg,gif,svg,ico}"],
                tasks: ["newer:imagemin"],
                options: {
                    spawn: false,
                }
            },
            copy: {
                files: ['src/**'],
                tasks: ['copy:main', 'compress']
            }
        }
    });
    grunt.registerTask('default', ['watch']);
};