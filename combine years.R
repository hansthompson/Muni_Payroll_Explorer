library(xlsx)

payroll2012 <- read.xlsx("C:\\Users\\Hans T\\Desktop\\Muni_Payroll_Explorer\\2012-Anc-Muni-PayrolltsortedHighesttoLowestPaid1.xlsx",
               sheetIndex = 2, 
               header = TRUE,
               colIndex = 1:8,
               rowIndex = 1:3201)

payroll2013 <- read.xlsx("C:\\Users\\Hans T\\Desktop\\Muni_Payroll_Explorer\\MUNI-Payroll-Password-protected2.xlsx",
               header = TRUE,
               sheetIndex = 1)


year <- 2012
payroll2012 <- cbind(payroll2012, year)
payroll2012 <- payroll2012[,-c(4,8)]
year <- 2013
payroll2013 <- cbind(payroll2013, year)

colnames(payroll2013)[59] <- "Benefits"
colnames(payroll2013)[43] <- "Earnings"


subset2013 <- data.frame(payroll2013$Name, 
           payroll2013$Job.Title, 
           payroll2013$Bargaining.Unit,
           payroll2013$Earnings, 
           payroll2013$Overtime, 
           payroll2013$Benefits,
           payroll2013$year)
colnames(subset2013) <- colnames(payroll2012)


payroll <- rbind(payroll2012, subset2013)
payroll$year <- factor(payroll$year)

save(payroll, file = "payroll.rda")
