process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

// Webpacker 5's compression plugins use MD4, which is unavailable with the
// OpenSSL version bundled with Node.js 24. The application packs are unchanged;
// only optional pre-compressed .gz and .br copies are skipped.
environment.plugins.delete('Compression')
environment.plugins.delete('Compression Brotli')

module.exports = environment.toWebpackConfig()
