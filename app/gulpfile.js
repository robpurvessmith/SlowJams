'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var browserify = require('browserify');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var gutil = require('gulp-util');
var _ = require('lodash');

gulp.task('build', function () {

    // add custom browserify options here
    var b = browserify({
        entries: ['client/src/slowjams/app.js']
    });

    return b.bundle()
        // log errors if they happen
        .on('error', function (err) {

            gutil.log(err.message);
            this.emit('end');
        })
        .pipe(source('bundle.js'))
        // optional, remove if you don't need to buffer file contents
        .pipe(buffer())
        // Add transformation tasks to the pipeline here.
        .pipe(gulp.dest('client/dist/js'));
});

// dev dependencies
if (process.env.NODE_ENV !== 'production') {

    var browserSync = require('browser-sync').create();
    var watchify = require('watchify');
    var sourcemaps = require('gulp-sourcemaps');
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
            .pipe(sass())
            .pipe(gulp.dest('client/src/css'))
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

        return w.bundle()
            // log errors if they happen
            .on('error', function (err) {

                gutil.log(err.message);
                browserSync.notify('Browserify Error!');
                this.emit('end');
            })
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

    gulp.task('bundle', bundle);
    w.on('update', bundle);  // on any dep update, runs the bundler
    w.on('log', gutil.log);  // output build logs to terminal

    gulp.task('watch', ['browserSync', 'sass', 'bundle'], function () {

        // watch scss files
        gulp.watch('client/src/scss/**/*.scss', ['sass']);

        // watch html files
        gulp.watch(['client/src/**/*.html'], browserSync.reload);

        // watchify handles watching js files
    });

    gulp.task('lint', function () {

      return gulp.src('client/src/**/*.js')
        .pipe(jshint())
        .pipe(jscs())
        .pipe(stylish.combineWithHintResults())
        .pipe(jshint.reporter('jshint-stylish'))
        .pipe(jshint.reporter('fail'));
    });

    gulp.task('default', ['watch']);
}