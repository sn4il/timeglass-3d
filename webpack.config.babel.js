import path    from 'path';
import webpack from 'webpack';

export default {
  entry: './src/index.js',

  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'bundle.js'
  },

  module: {
    rules: [{
      test: /\.js/,
      exclude: /node_modules/,

      use: [{
        loader: 'babel-loader'
      }]
    }, {
      test: /\.scss$/,

      use: [{
        loader: 'style-loader'
      }, {
        loader: 'css-loader'
      }, {
        loader: 'sass-loader',

        options: {
          includePaths: ['./node_modules']
        }
      }]
    }]
  }
};

