const webpack = require('webpack');

module.exports = function (config) {
  return {
    devtool: 'eval-source-map',

    output: {
      path: config.dist,
      filename: '[name].js'
    },

    devServer: {
      historyApiFallback: true,
      contentBase: config.src,
      inline: true,
      hot: true,
      host: '0.0.0.0',
      port: '8080',
      quiet: true,
      noInfo: true
    },

    module: {
      rules: [
        {
          test: /\.elm$/,
          include: config.src,
          loader: 'elm-hot-loader!elm-webpack-loader?verbose=true&warn=true&debug=true'
        },
        {
          test: /\.css$/,
          include: config.src,
          use: ['style-loader', 'css-loader']
        }
      ]
    },

    plugins: [
      new webpack.HotModuleReplacementPlugin(),
      new webpack.NamedModulesPlugin()
    ]
  };
};
