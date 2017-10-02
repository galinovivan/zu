const webpack = require('webpack');

require('es6-promise').polyfill();

module.exports = {
    entry: './assets/js/src/app.js',
    output: {
        path: __dirname,
        filename: 'assets/js/dist/bundle.js'
    },

    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/
            },
        ],
    },
    stats: {
        color: true
    },


};

