var webpack = require('webpack');

module.exports = {
  entry: {
    'timeglass-3d':     './src/index.coffee',
    'timeglass-3d.min': './src/index.coffee'
  },

  output: {
    path: require('path').resolve(__dirname, 'lib'),
    filename: '[name].js',

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
    }),

    new webpack.optimize.UglifyJsPlugin({
      include: /\.min\.js$/,

      minimize:  true,
      sourceMap: true
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

