React = require "react"
Template = require "./template"
{Row, Col} = require "react-bootstrap"

module.exports = React.createClass {
  render: () ->
    <Template>
      <Row>
        <Col xs={12}>
          {"Home"}
        </Col>
      </Row>
    </Template>
}
