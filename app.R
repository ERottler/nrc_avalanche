###

# Shiny dashboard NatRiskChange Task Force 'Avalanche'
# Erwin Rottler, University of Potsdam

###

library(shiny)
library(shinydashboard)
library(dplyr)
library(shinyjs)
library(glue)
library(shinyauthr)
library(leaflet)


ui <- dashboardPage(
  skin = "black",
  
  dashboardHeader(title = "NRC Task Force",
                  titleWidth = 200,
                  tags$li(class = "dropdown", style = "padding: 8px;",
                          shinyauthr::logoutUI("text", label = "Avalanche Schnals, South Tyrol",
                                               class = "btn-danger", style = "color: white")
                          )
  ),
  
  dashboardSidebar(
    collapsed = F,
    width = 200,
    sidebarMenu(
      menuItem("Task Force", tabName = "task", icon = icon("align-left")),
      menuItem("Media coverage", tabName = "media", icon = icon("newspaper")),
      menuItem("Accident", tabName = "accident", icon = icon("exclamation-circle")),
      menuItem("Avalanche Risk", tabName = "risk", icon = icon("stop-circle")),
      menuItem("Field trip", tabName = "trip", icon = icon("snowflake")),
      menuItem("Measurements", tabName = "measure", icon = icon("chart-area")),
      menuItem("Contact", tabName = "contact", icon = icon("address-card"))
    )
  ),
  
  dashboardBody(
    tabItems(
      
      # Tab content 'Task Force'
      tabItem(tabName = "task",
              
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "Task Force", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("On 28/12/2019 a large avalanche buried several skiers in the ski resort at the Val Senales 
                                 Glacier, South Tyrol. Three German ski tourists were fatally injured. The accident gave rise
                                 to grief and dismay not just among affected families, but in the entire winter sport community. 
                                 The tragedy was extensively covered by local and international media. The scene of accident is 
                                 located in close proximity to the high mountain climate station 'Bella Vista' operated by the 
                                 University of Innsbruck. The unique instrument composition at the measurement site inter alia
                                 enables investigations of wind-driven snow redistribution, a process that might have played an 
                                 important role in the genesis of the fatal avalanche. In the framework of a NatRiskChange Task 
                                 Force, we aim to examine the event in more detail. The examination consists of five parts:",
                                 align = "justify"),
                         tags$ul(
                           tags$li(tags$h4("Compilation and summary of media coverage")), 
                           tags$li(tags$h4("Description of the accident based on media and avalanche reports")),
                           tags$li(tags$h4("Assessment of past and present changes in avalanche risk in the Alps")),
                           tags$li(tags$h4("Field trip to the site of accident together with colleagues from University of Innsbruck")),
                           tags$li(tags$h4("Analysis of measurment data with regard to wind-driven snow redistribution"))
                         )
                       )
                       
                       
                       ),
                
                column(width = 6,
                       
                       box(
                         title = "Overview Map", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         leafletOutput("map")
                       )
                       
                       
                )
                
                
              )
      ),
      
      # Tab content 'Summmary'
      tabItem(tabName = "accident",
              
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "Accident", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("The avalanche was triggered midday around 12:10 and started high above the ski 
                                 slope at elevations around 3000 m asl. According to the mountain rescue team it
                                 had a length of approximately 1 km and was  about 200 m wide. On its way down the steep
                                 hillside, it more and more increase in size and even was able to surpase the little
                                 depression located before the ski run. Large masses of snow reached the prepared ski run.
                                 Around 100 people from the mountain rescue service with search dogs and fire fighters
                                 were at the scene of accident to rescue victims.
                                 On the day of accident, the avalanche report assigned a 'considerable' level of danger for the area. 
                                 It pointed out that 'even single winter sport participants can release avalanches easily, 
                                 including dangerously large ones.' Furthermore, it hints at the possibility of natural 
                                 avalanches in high Alpine regions. The main source of danger is wind-drifted snow. 
                                 Strong northerly winds redistributed fresh snow from the previous day to form wind slabs 
                                 that poorly bond to the old snowpack.", align = "justify")
                         ),
                       
                       box(
                         title = "Avalanche victim rescue", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F,  width = NULL,
                         tags$img(src='avalanche_3.jpeg', align = "center", width = '100%', height = "20%"),
                         tags$h6("© Photo: Uncredited/ANSA/AP/dpa")
                       )
                       
                         ),
                
                column(width = 6,
                       
                       box(
                         title = "Helicopter at the scene of accident", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F,  width = NULL,
                         tags$img(src='avalanche_2.jpeg', align = "center", width = '100%', height = "20%"),
                         tags$h6("© Photo: Uncredited/ANSA/AP/dpa")
                       )
                       
                ),
                
                box(
                  title = "Avalanche report 28/12/2020 (ENG)", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = 12,
                  tags$iframe(style="height:600px; width:100%; scrolling=yes", src = "2019-12-28_IT-32-BZ_en.pdf")
                ),
                
                box(
                  title = "Lawinen report 28/12/2020 (DEU)", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = 12,
                  tags$iframe(style="height:600px; width:100%; scrolling=yes", src = "2019-12-28_IT-32-BZ_de.pdf")
                )
                
                
                       )
              ),
      
      # Tab content 'Media coverage'
      tabItem(tabName = "media",
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "Media coverage", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("In the following, we present a selection of media reports covering the accident.
                                 In addition to local newspapers, numerous important media companies covered the incidence.
                                 In the accident a mother and her 7-year old daughter from Thuringia, Germany and another 
                                 7-year girl from North-Rhine-Westphalia, Germany, died. The father and brother of the girl 
                                 from NRW were injured. Condolences were inter alia sent from prime Minister of Thuringia 
                                 Bodo Ramelow and the German minister of defence Annegret Kramp-Karrenbauer. The following days,
                                 the question arises, how this terrible accident was possible. Experienced stuff of the ski lift 
                                 management assesses the security within the ski resort on a daily basis. The could not detect the 
                                 immediate danger. In addition, it is not sure whether the avalanche triggerted on its own 
                                 (an act of nature beyond control) or weather tour hikers set off the avalanche. The public 
                                 prosecution office of Bozen ordered a 
                                 report from the responsible avalanche commission and started investigations on involuntary manslaugter.",
                                 align = "justify")
                       ),
                       
                       box(
                         title = "ORF Tirol", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed =F,  width = NULL,
                         tags$a(href="https://tirol.orf.at/stories/3027879/", 
                                "Lokalaugenschein nach Lawinendrama"),
                         tags$img(src='screenshot_orf.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Tiroler Tageszeitung", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.tt.com/artikel/16490101/toedlicher-lawinenabgang-in-suedtirol-bleibt-raetselhaft", 
                                "Tödlicher Lawinenabgang in Südtirol bleibt rätselhaft"),
                         tags$img(src='screenshot_tt.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Mitteldeutscher Rundfunk (MDR)", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.mdr.de/thueringen/lawinenunglueck-suedtirol-100.html", 
                                "Skifahrer aus Thüringen bei Lawinenunglück ums Leben gekommen"),
                         tags$img(src='screenshot_mdr.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Neue Züricher Zeitung (NZZ)", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.nzz.ch/panorama/frau-und-zwei-kinder-in-suedtirol-von-lawine-verschuettet-und-getoetet-lawinenabgang-auch-in-der-region-von-leysin-ld.1531101", 
                                "Frau und zwei Kinder aus Deutschland in Südtirol von Lawine getötet – im Wallis verschütteter Tourengänger inzwischen gestorben"),
                         tags$img(src='screenshot_nzz.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Südtirol News", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.suedtirolnews.it/chronik/drei-lawinen-tote-im-schnalstal-ermittlungen-der-staatsanwaltschaft", 
                                "Drei Lawinen-Tote im Schnalstal: Ermittlungen der Staatsanwaltschaft"),
                         tags$img(src='screenshot_suedtirolnews.png', align = "center", width = '100%', height = "20%")
                       )
                       
                       
                       ),
                
                column(width = 6,
                       
                       box(
                         title = "Tagesschau", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F,  width = NULL,
                         tags$a(href="https://www.tagesschau.de/ausland/lawine-suedtirol-105.html", 
                                "Schock und Ermittlungen nach der Lawine"),
                         tags$img(src='screenshot_tagesschau.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Berliner Morgenpost", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.morgenpost.de/vermischtes/article228011759/Suedtirol-Lawine-reisst-in-Schnalstal-auf-Skipiste-Frau-und-Kinder-in-Tod-Opfer-aus-NRW.html", 
                                "Lawinen in Südtirol - Ermittlungen wegen fahrlässiger Tötung"),
                         tags$img(src='screenshot_morgenpost.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Frankfurte Allgemeine Zeitung", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.faz.net/aktuell/gesellschaft/ungluecke/drei-tote-nach-lawine-haette-die-talabfahrt-gesperrt-werden-muessen-16557539.html", 
                                "Hätte die Talabfahrt gesperrt werden müssen?"),
                         tags$img(src='screenshot_faz.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       
                       box(
                         title = "Spiegel", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.spiegel.de/panorama/suedtirol-staatsanwalt-ermittelt-nach-lawinenunglueck-gegen-fuenf-menschen-a-1303196.html", 
                                "Staatsanwaltschaft ermittelt nach Lawinenunglück gegen fünf Menschen"),
                         tags$img(src='screenshot_spiegel.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Zeit Online", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.zeit.de/gesellschaft/zeitgeschehen/2019-12/alpen-lawinen-unglueck-tote-auswaertiges-amt", 
                                "Mehrere Tote bei Lawinenabgängen"),
                         tags$img(src='screenshot_zeit.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Focus Online", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.focus.de/panorama/welt/skigebiet-schnalstal-deutsche-frau-und-kind-7-sterben-bei-lawine-in-suedtirol_id_11500678.html", 
                                "Frau und zwei Mädchen aus Deutschland sterben bei Lawine in Südtirol"),
                         tags$img(src='screenshot_fokus.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Corriere", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$a(href="https://www.corriere.it/cronache/19_dicembre_28/valanga-val-senales-travolti-sciatori-due-morti-grave-bambino-fb5e0954-2983-11ea-a8f0-127c1f8f40cd.shtml?refresh_ce-cp", 
                                "Valanga in Val Senales, travolti sciatori: morte una donna e due bambine"),
                         tags$img(src='screenshot_corriere.png', align = "center", width = '100%', height = "20%")
                       )
                ),
                
                box(
                  title = "Tagesschau24", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = 12,
                  tags$a(href="https://www.tagesschau.de/ausland/lawine-suedtirol-105.html",
                         "Drei Deutsche bei Lawinenunglück getötet"),
                  tags$video(id="video", type = "video/mp4",src = "TV-20191229-1119-3301.webxl.h264.mp4",
                             controls = "controls", width = 800)
                )
                
                       )
              
                ),
      
      # Tab content 'Avalanche Risk'
      tabItem(tabName = "risk",
              
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "How often do accidents like these occure?", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("In December 2019, two incidents where avalanches affected secured ski slopes and buried several 
                                 people occurred within a few days, one in Andermatt-Sedrun in Switzerland and the other is the 
                                 avalanche accident in Schnals investigated in this taskforce. While media describe incidents like 
                                 this as “very rare”, we wondered, how unusual these incidents really are and whether we 
                                 can find statistics on this.", align = "justify"), 
                         tags$h4("Unfortunately, this proves difficult to assess: the number of 
                                 fatalities due to avalanches on ski slopes is not registered separately, but is included in number 
                                 of avalanche fatalities in “controlled terrain”: the term includes settlements and buildings as 
                                 well as transportation corridors such as roads, ski runs and winter hiking trails. For these terrains, 
                                 generally some authority is responsible for the safety and must take appropriate measures to reduce 
                                 the risk [1]. In the case of a ski run for example, this would be the ski area 
                                 management operating it.", align = "justify"),
                         tags$h4("In Austria, strict regulations on avalanche control are in place with regard 
                                 to ski areas, which combine technical measures, forecasting, artificial release and the temporary 
                                 closure of slopes [2]. In contrast, “uncontrolled terrain” refers to areas outside 
                                 settlements and away from transportation corridors, where the recreationist or group tour guide 
                                 is responsible for assessing the local avalanche danger before embarking on activities such as 
                                 ski-touring and off-piste riding.", align = "justify")
                         ),
                       
                       box(
                         title = "Avalanche Fatalities: Long-term Trends", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("The graph below shows the number of fatalities in controlled and uncontrolled terrains since 
                                 the 1950s in Switzerland, Austria and Slovenia assessed in [1]:", align = "justify"),
                         tags$img(src='stats_graph.png', align = "center", width = '100%', height = "20%"),
                         tags$h4("Fatalities due to avalanches in controlled terrain decreased strongly since the 1950s. This is mainly due to 
                                 increasing knowledge about and implementation of protective measures e.g. for roads following the catastrophic
                                 avalanche winters in 1951 and 1954 [2]. Since the total number of fatalities in controlled terrain
                                 are very low in recent years, this also means that avalanche fatalities on ski slopes must be quite rare. ", 
                                 align = "justify"),
                         tags$h4("At the same time, the number of fatalities in uncontrolled terrain increased, probably due to the increasing
                                 popularity of activities such as ski touring. Broken down to different disciplines in uncontrolled terrain, 
                                 ski-touring and off-piste riding are especially dangerous: e.g. in Tyrol the season of 2018/19, 5 fatalities 
                                 occurred related to ski-touring, 9 related to off-piste riding and 3 to hiking/mountaineering [3]. However, 
                                 despite the estimated 1.2 Million active ski tourers [4] and the increasing popularity of the sport, the number 
                                 of fatalities has apparently not been increasing in the last 10 years [5] and even stayed relatively stable since
                                 the 1980s despite the strong increase in the number of backcountry recreationists since then [1]. ", 
                                 align = "justify"),
                         tags$h4("This is likely due to an increasing awareness of the risk and widespread use of avalanche rescue equipment, 
                                 but also information made available e.g. by the German Alpine Association, where decision-making tools for 
                                 the individual ski tourer are explained: building upon publicly available daily avalanche forecasts and 
                                 instructions for assessing local conditions, the risk can be estimated for the specific location of interest
                                 using the “avalanche mantra” [6].", 
                                 align = "justify")
                         )
                       
                         ),
                
                column(width = 6,
                       
                       box(
                         title = "Future changes in avalanche risk in the European Alps", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL, collapsed = F,
                         tags$h4("As we have seen, the number of avalanche fatalities decreased in controlled terrain in the past due to preventive measures and 
                                 implementation and training of local avalanche commissions. Yet another interesting question if there might 
                                 be an opposing trend in avalanche hazard due to climate change. This seems likely since possible avalanche 
                                 triggering factors such as precipitation or temperature will be affected by climate change. However, it has
                                 apparently not been proven that avalanche events will accumulate in the near future [2]: On the 
                                 one hand, studies investigating avalanche activity in the past were not able to detect long-term changes. 
                                 On the other hand, studies investigating avalanche activity under climate scenarios showed that avalanche 
                                 hazard might decrease slightly in winter due to more rapid equitemperature metamorphism and thus settling 
                                 rate of snow packs [2]. Also, avalanche hazard will likely decrease in May/June, probably due to 
                                 the decreasing availability of snow during this time of year. However, the relative proportion of wet snow 
                                 avalanches might increase in the future. ", align = "justify")
                         
                         ),
                       
                       box(
                         title = "References", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL, collapsed = F,
                         tags$h6("[1] Techel et al. 2016. „Avalanche Fatalities in the European Alps: Long-Term Trends and Statistics“. Geographica Helvetica 71, Nr. 2 (28. Juni 2016): 147–59. https://doi.org/10.5194/gh-71-147-2016."),
                         tags$h6("[2] Höller P. 2007: Avalanche Hazards and Mitigation in Austria: A Review“. Natural Hazards 43, Nr. 1 (1. Oktober 2007): 81–101. https://doi.org/10.1007/s11069-007-9109-2."),
                         tags$h6("[3] https://de.statista.com/statistik/daten/studie/798794/umfrage/lawinentote-in-oesterreich-nach-bundeslaendern/"),
                         tags$h6("[4] https://www.sueddeutsche.de/reise/trendsport-skitour-spass-ohne-risiko-1.3847341"),
                         tags$h6("[5] https://www.alpinmesse.info/data/docs/2019/Leseprobe_Statistik%20Skitour_AB%20Winter%202018_19.pdf"),
                         tags$h6("[6] https://www.alpenverein.de/bergsport/sicherheit/winter/das-lawinen-mantra-strategie-handwerkszeug_aid_34410.html")
                       )
                       
                       )
                
                
                       )
                ),
      # Tab content 'Field trip'
      tabItem(tabName = "trip",
              
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "Field Trip", collapsible = T,  status = NULL, solidHeader = TRUE, width = NULL,
                         tags$h4("A field trip to the Alps between 18-20 February made a visit of the scene of accident 
                                 and the surrounding area possible. The venture was undertaken in collaboration with the 
                                 University of Innsbruck. Under the leadership of Univ.-Prof. Dr. Ulrich Strasser, 
                                 head of the working group 'Human-environment systems research', and his research associate 
                                 Dr. Michael Warscher, students were trained in high alpine terrain. Focus was on a combination 
                                 of practical and theoretical teaching units on snow research and avalanche awareness. 
                                 The field trip included an introduction to the high alpine measurement network in the Rofental. 
                                 Particular attention was put on the measurement site 'Bella Vista' (see section 'Measurements').", align = "justify")
                         ),
                       
                       box(
                         title = "Trip to Grawand via Hochjochferner", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, width = NULL,
                         tags$img(src='grawand.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Practical exercise Rutschblock test", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, width = NULL,
                         tags$img(src='rutschblock.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Visit scene of accident", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='avalanche_slope.png', align = "center", width = '100%', height = "20%")
                       )
                       
                         ),
                
                column(width = 6,
                       
                       box(
                         title = "Practical exercise avalanche probes", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, width = NULL,
                         tags$img(src='aval_probs.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Trip to Im Hinteren Eis and Hintereisferner", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, width = NULL,
                         tags$img(src='DSCF1056.jpg', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Practical exercise avalanche burial/search", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='avalanche_burial.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Practical exercise snow profiles", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='snow_profiles.png', align = "center", width = '100%', height = "20%")
                       )
                       
                )
                
                       )
              ),
      
      # Tab content 'Measurements'
      tabItem(tabName = "measure",
              
              fluidRow(
                
                column(width = 6,
                       
                       box(
                         title = "Measurements", collapsible = T,  status = NULL, solidHeader = TRUE, width = NULL,
                         tags$h4("The measurement site 'Bella Vista' is located 2805 m asl at formerly glaciated ground. The site is part of the Long-Term Socio-Ecologial Research (LTSER) area Rofental. It is operated by the 
                                 University of Innsbruck, Department of Geography and data inter alia is used to 
                                 assess avalanche risk and risk of flooding in the region. The specific station set-up 
                                 with snow pillow and snow scale enables investigations of wind-driven snow-redistribution.
                                 The snow scale in the hollow only was installed the previous summer (see pictures below). 
                                 Analysis results hint at strong wind the night before the accident. Snow is removed from the
                                 snow pillow and accumulates on the snow scale.", align = "justify")
                         ),
                       
                       box(
                         title = "Time series plots", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, align = 'center', width = NULL,
                         tags$img(src='bv_plot.png', align = "center", width = '100%')
                       ),
                       
                       box(
                         title = "Installation snow scale 09/2019", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='scale_install.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "View from the cabin Bella Vista 02/2020", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='bv_winter_view.png', align = "center", width = '100%', height = "20%")
                       )
                       
                         ),
                
                column(width = 6,
                       
                       box(
                         title = "Measurement set-up", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = F, width = NULL,
                         tags$img(src='stat_scheme.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "LTSER Rofental", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T, width = NULL,
                         tags$img(src='rofental.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "Bella Vista station 02/2020", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$img(src='bv_winter.png', align = "center", width = '100%', height = "20%")
                       ),
                       
                       box(
                         title = "View from cabin Bella Vista 09/2019", collapsible = T,  status = NULL, solidHeader = TRUE, collapsed = T,  width = NULL,
                         tags$img(src='scale_install_II.png', align = "center", width = '100%', height = "20%")
                       )
                       
                )
                
                       )
              ),
      
      # Tab content 'Summmary'
      tabItem(tabName = "contact",
              
              fluidRow(
                
                column(width = 12,
                       
                       box(
                         title = "RTG NatRiskChange", collapsible = T,  status = NULL, solidHeader = TRUE,  width = NULL,
                         tags$h4("This dashboard was assembled in the framework of a NatRiskChange Task Force by Erwin Rottler 
                                 and Lena Katharina Schmidt. For further information on the research training group and our activities, 
                                 please visit 'www.natriskchange.de'. We thank the working group 'Human-environment systems research' 
                                 of the University of Innsbruck, particularly Ulrich Strasser and Michael Warscher, for their support. "),
                         tags$h4("Should you have any question or have/want further information, please do not hesitate to contact us: rottler(a)uni-potsdam.de")
                         
                       )
                )
                
                
              )
      )
      ),
    
    HTML('<div data-iframe-height></div>')
  
    )
)

server <- function(input, output, session) {
  
  points <- eventReactive(input$recalc, {
    # cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
    cbind(10.784606, 46.780291)
  }, ignoreNULL = FALSE)
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$OpenTopoMap, group = "Open Topo") %>%
      addCircleMarkers(data = points(), color = "red")

  })
  

}

shiny::shinyApp(ui, server)