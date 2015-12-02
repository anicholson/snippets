'use strict';

var gulp        = require('gulp'),
    elm         = require('gulp-elm'),
    browserSync = require('browser-sync');

var elmInit = elm.init,
    reload  = browserSync.reload;

gulp.task('elm.init', elmInit);

gulp.task('elm', ['elm.init'], function () {
  gulp.src('app/*.elm')
    .pipe(elm())
    .pipe(gulp.dest('.tmp'))
    .pipe(gulp.dest('dist'));
})

gulp.task('elm-watch', ['elm.init', 'elm'], function() {
    gulp.watch('app/**/*.elm', ['elm']);
    gulp.watch('.tmp/App.js').on('change', reload);
});

gulp.task('build', ['elm']);

gulp.task('serve', ['build'], function() {
  browserSync({
    notify: false,
    port: 9000,
    server: {
      baseDir: ['.tmp', 'app']
    }
  });

    gulp.start('elm-watch');
});

gulp.task('default', ['build']);
