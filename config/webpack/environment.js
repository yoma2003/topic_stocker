const { environment } = require('@rails/webpacker')

environment.config.merge({
  performance: {
    hints: 'warning'
  }
})

module.exports = environment
