---
id: "working-with-charts"
url: "assembly/developer-guide/working-with-charts"
title: "Working with Charts"
weight: 5
productName: "GroupDocs.Assembly Cloud"
description: "Working with Charts"
keywords: ""
---

1. [Binding Chart to a Data Source]({{< param url >}}/#binding-chart-to-a-data-source)
2. [Specifying Chart Options]({{< param url >}}/#specifying-chart-options)
3. [Excluding Chart Series]({{< param url >}}/#excluding-chart-series)
4. [Working with Colors]({{< param url >}}/#working-with-colors)
    * [Configuring Chart Series Colors]({{< param url >}}/#configuring-chart-series-colors)
    * [Configuring Chart Series Point Colors]({{< param url >}}/#configuring-chart-series-point-colors)

A good template layout should reflect the client’s view and the kinds of questions he will ask. Graphics (diagrams and charts) and tabular data are usually combined with the relative weighting depending on the client’s preferences and analytical demands - that provides additional insight into specific trends that may not be evident from simple tabular reports.

It's possible to use many sorts of data charts and graphs in your document template, including line graphs, column charts, bar charts, pie charts, scatter graphs, bubble graphs and others. The Reporting Engine provides a group of special tags to bind the chart to a data source through ***Chart Series*** - logically grouped multi-value data elements - that function as wrappers around data that will be displayed, and also associates styles with the data.

## Binding Chart to a Data Source

To declare a chart that is going to be populated with data dynamically within your template, do the following steps:

1. Add a chart to your template at the place where you want it to appear in a result document.
2. Configure the appearance of the chart.
3. Add required chart series and configure their appearance as well.
4. Add a title to the chart, if missing.
5. Add an opening **`foreach`** tag to the chart title.
6. Please take note, that a closing **`foreach`** tag is not used for a chart.
7. Depending on the type of the chart, add **`x`** tags to the chart title or chart series’ names as follows:

```C#
<<x [x_value_expression]>>
```

An `x-value` expression for a must return a numeric value. To use the same `x-value` expression for all chart series, add a single **`x`** tag to the chart title after the corresponding **`foreach`** tag. To use different `x-value` expressions for every chart series, add multiple **`x`** tags to chart series’ names – one for each chart series.

You can use a **`size`** tag to define the size of bubbles for a Bubble Chart.

8. Depending on the type of the chart, add an **`y`** tags to chart series’ names as follows:

```C#
<<y [y_value_expression]>>
```

An `y-value` expression must return a numeric value.

For a complete example of binding data to a chart using **`x`** and **`y`** tags, please, refer to the [Quick Start](/assembly/getting-started/quick-start/#generating-a-report-in-three-steps) section.

## Specifying Chart Options

You can normally use common expression tags in chart titles, series names, and axis titles, thus forming their contents dynamically.

The following chart template demonstrates how to set the chart’s title, series name, and axis title dynamically:

![Chart Template Example](/assembly/images/working-with-charts/chart_example_1.png)

## Excluding Chart Series

You can select which series to remove from the chart dynamically through the conditional expression. For series to be removed from the chart based upon conditions dynamically, define the conditions in names of these series using **`removeif`** tags. During runtime, series with **`removeif`** tags, for which conditional expressions return `True`, are removed from corresponding charts.

The **`removeif`** tag syntax is as follows:

```C#
<<removeif [conditional_expression]>>
```

 The following template demonstrates how to use the **`removeif`** tag to remove a series from a chart:

![Chart Template Example](/assembly/images/working-with-charts/chart_example_2.png)

## Working with Colors

To work with colors dynamically you need to use ***Color Expressions***. A color expression must return a value of one of the following types:

* A string containing the name of known color, that is, the case-insensitive name of a member of the [KnownColor](https://msdn.microsoft.com/en-us/library/system.drawing.knowncolor(v=vs.110).aspx) enumeration such as `"red"`.
* An integer value defining RGB (red, green, blue) components of the color such as `0xFFFF00` (yellow).
* A value of the [Color](http://msdn.microsoft.com/en-us/library/system.drawing.color(v=vs.110).aspx) type.

### Configuring Chart Series Colors

For a chart series to be colored dynamically, define the corresponding color expressions in names of these series using **`seriesColor`** tag, which has the following syntax:

```C#
<<seriesColor [color_expression]>>
```

The following template demonstrates how to use the **`seriesColor`** tag:

![Chart Template Example](/assembly/images/working-with-charts/chart_example_3.png)

### Configuring Chart Series Point Colors

You can set colors of an individual chart series points dynamically through the color expression. For a chart series with points to be colored dynamically, define corresponding color expressions in names of these series using **`pointColor`** tag, which has the following syntax:

```C#
<<pointColor [color_expression]>>
```
