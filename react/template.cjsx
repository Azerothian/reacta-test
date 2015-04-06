React = require "react"

{Navbar,Nav,NavItem, Row, Col, Grid} = require "react-bootstrap"

{NavItemLink} = require "react-router-bootstrap"

module.exports = React.createClass {
#  mixins: [Navigation]
  render: () ->
    <Grid>
      <Row>
        <Col xs={12}>
          <Navbar>
            <Nav>
              <NavItemLink to="/">Home</NavItemLink>
              <NavItemLink to="/test">Test Page</NavItemLink>
            </Nav>
          </Navbar>
        </Col>
      </Row>
      {@props.children}
    </Grid>


}
