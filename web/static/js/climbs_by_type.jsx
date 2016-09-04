var React = require('react');
var DoughnutChart = require("react-chartjs-2").Doughnut;

var ClimbsByType = React.createClass({
  typeCounts: function() {
    var counts = {sport: 1, trad: 0}

    this.props.data.forEach(function(gradeData) {
      if (gradeData.type === "sport") {
        counts.sport += parseInt(gradeData.count, 10);
      } else {
        counts.trad += parseInt(gradeData.count, 10);
      }
    });

    return counts;
  },
  render: function() {
    var counts = this.typeCounts();
    var data = {
      labels: [
          "Trad",
          "Sport"
      ],
      datasets: [{
        data: [counts.trad, counts.sport],
        backgroundColor: [
            "#E74C3C",
            "#3498DB"
        ]
      }]
    };

    return (
      <div>
        <h3>Climbs by Type</h3>
        <DoughnutChart className='l-full-width' data={data} />
      </div>
    )
  }
});

module.exports = ClimbsByType;

