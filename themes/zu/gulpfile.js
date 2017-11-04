const gulp = require('gulp');
const watch = require('gulp-watch');
const uglify = require('gulp-uglify');
const sourceMaps = require('gulp-sourcemaps');
const cssMin = require('gulp-minify-css');
const imageMin = require('gulp-imagemin');
const pngQuant = require('imagemin-pngquant');
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const concat = require('gulp-concat');


const path = {
    build: {
        css: 'assets/css',
        css_mobile: 'assets/css/',
        image: 'assets/images'
    },
    src: {
        style: 'assets/scss/common.scss',
        style_mobile: 'assets/scss/mobile/index.scss',
        image: 'assets/images/src/*.*'
    }
};


const config = {
    server: {
        baseDir: '/assets/'
    },
    tunnel: true,
    hots: 'localhost',
    port: 9000,
    logPrefix: 'zu'
};


gulp.task('style:build', () => {
   gulp.src(path.src.style)
       .pipe(sourceMaps.init())
       .pipe(sass())
       .pipe(autoprefixer())
       .pipe(cssMin())
       .pipe(sourceMaps.write())
       .pipe(gulp.dest(path.build.css))
});

gulp.task('style:prod', () => {
   gulp.src(path.src.style)
       .pipe(sass())
       .pipe(autoprefixer())
       .pipe(cssMin())
       .pipe(gulp.dest(path.build.css))
});

gulp.task('meow', () => {
    gulp.src(path.src.style_mobile)
        .pipe(sass())
        .pipe(autoprefixer())
        .pipe(cssMin())
        .pipe(gulp.dest(path.build.css_mobile))
});


gulp.task('image:build', () => {
   gulp.src(path.src.image)
       .pipe(imageMin({
           progressive: true,
           svgoPlugins: [{ removeViewBox: false }],
           use: [pngQuant()],
           interplaced: true
       }))
       .pipe(gulp.dest(path.build.image));
});

gulp.task('prod:build', () => {
   gulp.start('style:prod');
   gulp.start('image:build');
});