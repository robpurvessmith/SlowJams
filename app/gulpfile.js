'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var cssnano = require('gulp-cssnano');
var browserify = require('browserify');
var uglify = require('gulp-uglify');
var plumber = require('gulp-plumber');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var sourcemaps = require('gulp-sourcemaps');
var gutil = require('gulp-util');
var _ = require('lodash');

// build css for production
gulp.task('css', function () {

    return gulp.src('client/src/scss/**/*.scss')
        .pipe(plumber(function (err) {

            gutil.log(err.message);
            gutil.beep();
            this.emit('end');
        }))
        .pipe(sass({
            includePaths: ['node_modules']
        }))
        // include sourcemaps
        .pipe(sourcemaps.init({
            loadMaps: true
        }))
        // minify css with cssnano
        .pipe(cssnano())
        // writes .map file
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('client/dist/css'));
});

// build js for production
gulp.task('js', function () {

    // add custom browserify options here
    var b = browserify({
        entries: ['client/src/slowjams/app.js'],
        debug: true
    });

    return plumber(function (err) {

        gutil.log(err.message);
        gutil.beep();
        this.emit('end');
    })
        .pipe(b.bundle())
        // filename parameter is a "pretend" filename that determines the final filename
        .pipe(source('bundle.js'))
        // buffer file contents
        .pipe(buffer())
        // include sourcemaps
        .pipe(sourcemaps.init({ loadMaps: true }))
        // minify files with UglifyJS
        .pipe(uglify())
        // writes .map file
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('client/dist/js'));
});

// called on postinstall
gulp.task('build', ['css', 'js']);


// dev dependencies
if (process.env.NODE_ENV !== 'production') {

    var browserSync = require('browser-sync').create();
    var watchify = require('watchify');
    var jshint = require('gulp-jshint');
    var jscs = require('gulp-jscs');
    var stylish = require('gulp-jscs-stylish');

    // start a Browsersync proxy
    gulp.task('browserSync', function () {

        browserSync.init({
            proxy: 'localhost:9000',
        });
    });

    // compile sass into css & auto-inject into browsers
    gulp.task('sass', function () {

        return gulp.src('client/src/scss/**/*.scss')
            .pipe(plumber(function (err) {

                gutil.log(err.message);
                gutil.beep();
                browserSync.notify('Browserify Error!');
                this.emit('end');
            }))
            .pipe(sass({
                includePaths: ['node_modules']
            }))
            .pipe(gulp.dest('client/dist/css'))
            .pipe(browserSync.stream());
    });

    // add custom browserify options here
    var customOpts = {
        entries: ['client/src/slowjams/app.js'],
        debug: true
    };
    var opts = _.assign({}, watchify.args, customOpts);
    var b = browserify(opts);
    var w = watchify(b);

    // add transformations here
    // e.g. w.transform(coffeeify);

    function bundle() {

        gutil.log('Compiling JS...');

        return plumber(function (err) {

            gutil.log(err.message);
            gutil.beep();
            browserSync.notify('Browserify Error!');
            this.emit('end');
        })
            .pipe(w.bundle())
            // filename parameter is a "pretend" filename that determines the final filename
            .pipe(source('bundle.js'))
            // optional, remove if you don't need to buffer file contents
            .pipe(buffer())
            // optional, remove if you dont want sourcemaps
            .pipe(sourcemaps.init({ loadMaps: true })) // loads map from browserify file
            // Add transformation tasks to the pipeline here.
            .pipe(sourcemaps.write('./')) // writes .map file
            .pipe(gulp.dest('client/dist/js'))
            .pipe(browserSync.stream({ once: true }));
    }

    w.on('update', bundle);  // on any dep update, runs the bundler

    w.on('log', gutil.log);  // output build logs to terminal

    gulp.task('bundle', bundle);

    gulp.task('watch', ['browserSync', 'sass', 'bundle'], function () {

        // watch scss files
        gulp.watch('client/src/scss/**/*.scss', ['sass']);

        // watch html files
        gulp.watch(['client/src/**/*.html'], browserSync.reload);

        // watchify handles watching js files
    });

    gulp.task('lint', function () {

      return gulp.src('client/src/**/*.js')
        .pipe(plumber(function (err) {

            gutil.log(err.message);
            gutil.beep();
            this.emit('end');
        }))
        .pipe(jshint())
        .pipe(jscs())
        .pipe(stylish.combineWithHintResults())
        .pipe(jshint.reporter('jshint-stylish'))
        .pipe(jshint.reporter('fail'));
    });

    gulp.task('default', ['watch']);
}