'use strict';

var gulp = require('gulp'),
     elm = require('gulp-elm'),
    browserSync = require('browser-sync');

var elmInit = elm.init;

gulp.task('elm.init', elmInit);

gulp.task('elm', ['elm.init'], function () {
  gulp.src('app/App.elm')
      .pipe(elm())
      .pipe(gulp.dest('.tmp'))
      .pipe(gulp.dest('dist'));
});

gulp.task('elm-watch', ['elm.init', 'elm'], function() {
  gulp.watch('app/**/*.elm', ['elm']);
});

gulp.task('build', ['elm']);

gulp.task('serve', ['build'], function() {
  return   browserSync({
    notify: false,
    port: 9000,
    server: {
      baseDir: ['.tmp', 'app'],
      routes: {
        '/bower_components': 'bower_components'
      }
    }
  });
});

gulp.task('default', ['build']);

