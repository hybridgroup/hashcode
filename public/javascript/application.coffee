$ ->
  width = 640
  height = 170

  x = d3.scale.ordinal()
      .rangeRoundBands([0, width], .1)

  colorScale = d3.scale.category10()

  y = d3.scale.linear()
      .range([height, 0])

  xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")

  yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")

  svg = d3.select("figure").append("svg")
      .attr("width", width)
      .attr("height", height)

  d3.json "/stats.json", (error, data) ->

    x.domain data.map (d) -> d.language
    y.domain [0, d3.max(data, (d) -> d.value )]

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)

    svg.selectAll(".bar")
        .data(data)
      .enter().append("rect")
        .attr("class", "bar")
        .attr("x", (d) -> x(d.language))
        .attr("width", x.rangeBand())
        .attr("y", (d) -> y(d.value))
        .attr("height", (d) -> height - y(d.value))
        .style("fill", (d, i) -> colorScale(i))
        .on("mouseover", (d, i) ->
          d3.select(this).style("fill", "white")
            .style("cursor", "pointer")
          $("table tbody tr:nth-of-type(#{i + 1}) td").css 'background', d3.rgb(colorScale(i)).brighter(0.8)
        )
        .on("mouseout", (d, i) ->
          d3.select(this).style("fill", colorScale(i))
          $("table tbody tr:nth-of-type(#{i + 1}) td").css 'background', ''
        )
