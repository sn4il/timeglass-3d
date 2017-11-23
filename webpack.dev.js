var webpack = require('webpack');

module.exports = {
  entry: './src/index.coffee',

  output: {
    path: require('path').resolve(__dirname, 'lib'),
    filename: 'timeglass-3d.js',

    library: 'timeglass3D',
    libraryTarget: 'umd'
  },

  module: {
    rules: [{
      test: /\.coffee$/,
      use: ['coffee-loader']
    }]
  },

  plugins: [
    new webpack.DefinePlugin({
      VERSION: JSON.stringify(require('./package.json').version),
    })
  ],

  externals: {
    three: {
      commonjs:  'three',
      commonjs2: 'three',

      root: 'THREE'
    }
  },

  devtool: 'source-map'
};

