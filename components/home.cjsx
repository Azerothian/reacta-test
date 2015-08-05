React = require "react"
Next = require "./next"

module.exports = React.createClass {
  render: () ->
    <div>
      {"Home - "}<Next />
    </div>
}
