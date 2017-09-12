const path = require('path');
const webpack = require('webpack');
const autoprefixer = require('autoprefixer');
const ExtractTextPlagin = require('extract-text-webpack-plugin');

require('es6-promise').polyfill();

module.exports = {
    entry: './assets/js/src/app.js',
    output: {
        path: __dirname,
        filename: 'assets/js/dist/bundle.js'
    },

    plugins: [
        new ExtractTextPlagin('assets/css/style.css')
    ],

    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/
            },
        ]
    },
    stats: {
        color: true
    },

    devtool: 'source-map'

};

