const { environment } = require('@rails/webpacker')

environment.config.merge({
  performance: {
    hints: false
  }
})

module.exports = environment
