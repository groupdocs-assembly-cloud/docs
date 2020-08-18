---
id: "working-with-charts"
url: "assembly/developer-guide/working-with-charts"
title: "Working with Charts"
weight: 5
productName: "GroupDocs.Assembly Cloud"
description: "Working with Charts"
keywords: ""
---

1.  [Chart Data Bindings](#HChartDataBindings)
2.  [Setting Chart Titles, Series Names, and Axis Titles Dynamically](#HSettingChartTitles2CSeriesNames2CandAxisTitlesDynamically)
3.  [Excluding a Chart Series Dynamically](#HExcludingaChartSeriesDynamically)
4.  [Working with Colors Dynamically](#HWorkingwithColorsDynamically)
    1.  [Setting Chart Series Colors Dynamically](#HSettingChartSeriesColorsDynamically)
    2.  [Setting Chart Series Point Colors Dynamically](#HSettingChartSeriesPointColorsDynamically)
5.  [See Also](#HSeeAlso)

A good template layout should reflect the client’s view and the kinds of questions he will ask. Graphics (diagrams and charts) and tabular data are usually combined with the relative weighting depending on the client’s preferences and analytical demands - that provides additional insight into specific trends that may not be evident from simple tabular reports.

It's possible to use many sorts of data charts and graphs in your document template, including line graphs, column charts, bar charts, pie charts, scatter graphs, bubble graphs and others. The Reporting Engine provides a group of special tags to bind the chart to a data source through ***ChartSeries*** - logically grouped multi-value data elements - that function as wrappers around data that will be displayed, and also associates styles with the data.

## Chart Data Bindings

To declare a chart that is going to be populated with data dynamically within your template, do the following steps:

1.  Add a chart to your template at the place where you want it to appear in a result document.
2.  Configure the appearance of the chart.
3.  Add required chart series and configure their appearance as well.
4.  Add a title to the chart, if missing.
5.  Add an opening ***foreach*** tag to the chart title.
6.  Please take note, that a closing ***foreach*** tag is not used for a chart.
7.  Depending on the type of the chart, add ***x*** tags to the chart title or chart series’ names as follows:

<<x \[x\_value\_expression\]>>

An ***x-value*** expression for a must return a numeric value. To use the same ***x-value*** expression for all chart series, add a single ***x*** tag to the chart title after the corresponding ***foreach*** tag. To use different ***x-value*** expressions for every chart series, add multiple ***x*** tags to chart series’ names – one for each chart series.

You can use a ***size*** tags to define the size of bubbles for a Bubble Chart.

8.  Depending on the type of the chart, add an ***y*** tags to chart series’ names as follows:

<<y \[y\_value\_expression\]>>

A ***y-value*** expression must return a numeric value.

For a complete example of using ***x*** and ***y*** tags to bind data to a chart, please, refer to an [example from Quick Start](/groupdocs-assembly-cloud-product-family/getting-started/quick-start/) section.

## Setting Chart Titles, Series Names, and Axis Titles Dynamically

You can normally use common expression tags in chart titles, series names, and axis titles, thus forming their contents dynamically.

The following chart template demonstrates how to set the chart’s title, series name, and axis title dynamically:

![image-20200803093747-1.png](/downloadrev/groupdocs-assembly-cloud-product-family/developer-guide/working-with-charts/WebHome/image-20200803093747-1.png?rev=1.1)

## Excluding a Chart Series Dynamically

You can select which series to remove from the chart dynamically through the conditional expression. For series to be removed from the chart based upon conditions dynamically, define the conditions in names of these series using ***removeif*** tags. During runtime, series with ***removeif*** tags, for which conditional expressions return true, are removed from corresponding charts.

The ***removeif*** tag syntax is as follows:

<<removeif \[conditional\_expression\]>>

 The following template demonstrates how to use the ***removeif*** tag to remove a series from a chart:

![image-20200803105749-1.png](/downloadrev/groupdocs-assembly-cloud-product-family/developer-guide/working-with-charts/WebHome/image-20200803105749-1.png?rev=1.1)

## Working with Colors Dynamically

A ***color-expression*** must return a value of one of the following types:

*   A string containing the name of known color, that is, the case-insensitive name of a member of the [KnownColor](https://msdn.microsoft.com/en-us/library/system.drawing.knowncolor(v=vs.110).aspx) enumeration such as “red”.
*   An integer value defining RGB (red, green, blue) components of the color such as 0xFFFF00 (yellow).
*   A value of the [Color](http://msdn.microsoft.com/en-us/library/system.drawing.color(v=vs.110).aspx) type.

### Setting Chart Series Colors Dynamically

You can set colors of a chart series dynamically through the ***color-expression***.

For a chart series to be colored dynamically, define corresponding ***color-expressions*** in names of these series using ***seriesColor*** tag, which has the following syntax:

<<seriesColor \[color-expression\]>>

The following template demonstrates how to use the*** seriesColor*** tag:

![image-20200803094344-3.png](/downloadrev/groupdocs-assembly-cloud-product-family/developer-guide/working-with-charts/WebHome/image-20200803094344-3.png?rev=1.1)

### Setting Chart Series Point Colors Dynamically

You can set colors of an individual chart series points dynamically through the ***color-expression***.

For a chart series with points to be colored dynamically, define corresponding ***color-expressions*** in names of these series using ***pointColor*** tag, which has the following syntax:

<<pointColor \[color-expression\]>>

## See Also
