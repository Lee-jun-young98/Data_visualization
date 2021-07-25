library(googleVis)
f1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
f1
plot(f1)

##MotionChart
f1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar='Year')
f2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date")
plot(f1)
plot(f2)




##PieChart
p1 <- gvisPieChart(CityPopularity, options = list(width=400,height=200))
plot(p1)

p2 <- gvisPieChart(CityPopularity, options = list(width=400,height=200,
  title='City Popularity',
                                                  legend='none',
                                                  pieSliceText='label',
                                                  pieHole=0.5))
plot(p2)
##CandlestickChart

c1 <- gvisCandlestickChart(OpenClose, options = list(title="Candlestick",
                                                     legend='none',
                                                     height=400, width=500))
plot(c1)


##BubbleChart
str(Fruits)
Fruits$Year <- as.factor(Fruits$Year)
b1 <- gvisBubbleChart(Fruits, idvar = 'Fruit', xvar='Sales',
                      yvar = 'Expenses', colorvar='Year', sizevar='Profit',
                      options=list(height=500, weight=800,
                                   hAxis='{minValue:75, maxValue:125}'))
plot(b1)


##AnnotationChart
A1 <- gvisAnnotationChart(data=Stock, datevar="Date",numvar="Value",
                          idvar="Device", titlevar="Title",
                          annotationvar="Annotation",
                          options=list(width=1000, height=500, fill=10, colors="['red', 'blue']"))
plot(A1)




##ScatterChart
M <- matrix(nrow=6, ncol=6)
M[col(M)==row(M)] <- 1:6
d <- data.frame(x=1:6, M)
d

s2 <- gvisScatterChart(d, options=list(
  title="Customizing points",
  legend="right",
  pointSize=30,
  series="{
  0: {pointShape: 'circle'},
  1: {pointShape: 'triangle'},
  2: {pointShape: 'square' },
  3: {pointShape: 'diamond' },
  4: {pointShape: 'star' },
  5: {pointShape: 'polygon' }
  }", width=800, height=400))
plot(s2)

s1 <- gvisScatterChart(women, options=list(
  legend="left",
  lineWidth=2,
  pointSize=0,
  title="Women", vAxis="{title:'weight(lbs)'}",
  hAxis="{title: 'heigth(in)'}",
  width=300, height=300))
plot(s1)

##Table
t1 <- gvisTable(Population,formats=list(Population="#,###",
                                        '% of World Population'='#.#%'),
                options=list(page='enable'))
plot(t1)



##OrgChart
o1 <- gvisOrgChart(Regions, options=list(width=600, height=400,
                                         size='large',allowCollapse=TRUE))
plot(o1)

o2 <- gvisOrgChart(Regions,
                   options=list(width=600, height=400,
                                size='medium', allowCollapse=FALSE))

plot(o2)

##TreeMap
r1 <- gvisTreeMap(Regions, "Region", "Parent", "Val", options=list(fontsize=16))
plot(r1)


##gvisMerge
v1 <- gvisGeoChart(Exports, "Country", "Profit",
                   options=list(width=300, height=300))
plot(v1)

v2 <- gvisGeoChart(Exports,
                   options=list(width=220, height=300))
plot(v2)

M1 <- gvisMerge(v1,v2,horizontal = TRUE)
plot(M1)

##gvisLineChart
df=data.frame(country=c("US","GB","BR"),
              val1=c(10,13,14),
              val2=c(23,12,32))
Line <- gvisLineChart(df)
plot(Line)


##gvisBarChart
Bar <- gvisBarChart(df)
plot(Bar)


##gvisColumnChart
Column <- gvisColumnChart(df)
plot(Column)


##gvisArea
Area <- gvisAreaChart(df)
plot(Area)


##gvisWordTree
wt1 <- gvisWordTree(Cats, textvar="Phrase")
plot(wt1)

##Gauge
Gauge <- gvisGauge(CityPopularity, options=list(min=0, max=800,greenFrom=500, greenTo=800, yellowFrom=300, yellowTo=500,redFrom=0, redTo=300, width=400, height=300))
plot(Gauge)
