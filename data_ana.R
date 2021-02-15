###

#Analysis Bella Vista station data
#Erwin Rottler, University of Potsdam 02/2020

###

library(xts)
library(scales)

data_dir <- "/home/rottler/ownCloud/RhineFlow/task_force/R/avalanche/data/"
file_bv <- paste0(data_dir, "csv/07150961_191004000000_-_200224182000.csv")

#read_data----
data_bv <- read.delim(file_bv, sep = ",", skip = 0, header = F, na.strings = c("999.9"), stringsAsFactors = F) # read data table
cnames_bv <- as.character(data_bv[1, ]) # get colnames
data_bv <- data_bv[-c(1:2), ] #remove first two rows
colnames(data_bv) <- cnames_bv #define colnames
colnames(data_bv)[1] <- "time"
data_bv$time <- as.POSIXct(data_bv$time) #define time column
#change characters to numeric values
for(i in 2:ncol(data_bv)){
  
  data_bv[ , i] <- as.numeric(data_bv[, i])
  
}
bv_xts <- xts::xts(data_bv, data_bv$time) #define time series object

#plot_data----
pdf(paste0(data_dir, "bv_fig.pdf"), width = 12, height = 6)

time_sel <- '2019-12-26 05:00:00 CET/2019-12-28 16:00:00 CET'

acci_time <- which(index(bv_xts$`Temperatur MW`[time_sel]) == "2019-12-28 12:40:00 CET")
x_tics <- which(as.character(index(bv_xts$`Temperatur MW`[time_sel])) %in% c("2019-12-27 00:00:00", "2019-12-28 00:00:00"))
x_labs <- c("27/12/2019", "28/12/2019")

par(mfrow = c(3, 2))

par(mar = c(2, 1.5, 2.5, 1.5))

#Temperature
ylims <- c(-15, -1)
plot(as.numeric(bv_xts$`Temperatur MW`[time_sel]), type = "l", axes = F, ylab = "", 
     xlab = "", ylim = ylims, xaxs = "i", yaxs = "i", lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(-14, 2, 4), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("a) Temperature [°C]", side = 3, line = 0.2, adj = 0.0, cex = 1)
mtext("accident", side = 3, line = 0.2, adj = 0.99, cex = 0.8, col = "red3")
graphics::box()

#Wind speed
ylims <- c(0, 20)
plot(as.numeric(bv_xts$`Wind WG_MAX`[time_sel]), type = "l", axes = F, ylab = "", xlab = "",
     ylim = ylims, xaxs = "i", yaxs = "i", lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(0, 20, 5), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("b) Wind speed [m/s]", side = 3, line = 0.2, adj = 0.0, cex = 1)
graphics::box()

#Radiation
ylims <- c(0, 450)
plot(as.numeric(bv_xts$`PyranoLo MW`[time_sel]), type = "l", axes = F, ylab = "", xlab = "",
     ylim = ylims, xaxs = "i", yaxs = "i", lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(100, 500, 100), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("c) Solar Radiation [W/m²]", side = 3, line = 0.2, adj = 0.0, cex = 1)
graphics::box()

#Snow pillow
ylims <- c(100, 190)
plot(as.numeric(bv_xts$`Schneekissen MW`[time_sel]), type = "l", ylim = ylims,
     axes = F, ylab = "", xlab = "", xaxs = "i", yaxs = "i", lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(100, 200, 20), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("d) Snow pillow [mmSWE]", side = 3, line = 0.2, adj = 0.0, cex = 1)
graphics::box()

#Air pressure
ylims <- c(718, 732)
plot(as.numeric(bv_xts$`Luftdruck MW`[time_sel]), type = "l", axes = F, ylab = "", xlab = "",
     xaxs = "i", yaxs = "i", ylim = ylims, lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(710, 740, 5), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("e) Air pressure [hPa]", side = 3, line = 0.2, adj = 0.0, cex = 1)
graphics::box()

#Snow scale
ylims <- c(300, 520)
plot(as.numeric(bv_xts$Schneewaage[time_sel]), type = "l", ylim = ylims, axes = F, ylab = "", 
     xlab = "", xaxs = "i", yaxs = "i", lwd = 1.5)
abline(v = x_tics, col = "grey55", lty = "dashed")
abline(h = seq(-300, 550, 50), col = "grey55", lty = "dashed")
axis(2, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
axis(1, at = x_tics, labels = x_labs, mgp = c(3, 0.2, 0), tck = -0.02, cex.axis = 1.0)
rect(acci_time-4, ylims[1], acci_time+4, ylims[2], col = scales::alpha("red3", alpha = 0.5), border = F)
mtext("f) Snow scale [mmSWE]", side = 3, line = 0.2, adj = 0.0, cex = 1)
graphics::box()

dev.off()
