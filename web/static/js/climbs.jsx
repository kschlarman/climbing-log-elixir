var React = require('react');
var Climb = require('./climb.jsx');
var classnames = require('classnames');

var Climbs = React.createClass({
  render: function() {
    var self = this;
    var climbs = this.props.climbs.map(function (climb) {
      return (
        <Climb climb={climb} onDelete={self.props.onDelete} key={climb.id} />
      );
    });
    return (
      <div>
        {climbs}
      </div>
    )
  }
});

module.exports = Climbs;
