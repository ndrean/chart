# Chart

`mix phx.gen.html Progress Revenue revenues year:integer amount:float`

`npm install chart.js --prefix assets --save`

<https://medium.com/blackode/how-to-use-chart-js-in-phoenix-elixir-advanced-f0949352f64f>

- insert "linechart.js" in "app.js"
- add the graphic in a canvas in "revenueview/index.html"

- in the view "RevenueView", define two functions and use the script below in te template "revenueview/index.html

```js
<script type="text/javascript">
  window.chart_data = <%= raw(Jason.encode!(fetch_chart_data @revenues)) %>
  window.chart_labels = <%= raw(Jason.encode!(fetch_chart_labels @revenues)) %>
</script>
```
