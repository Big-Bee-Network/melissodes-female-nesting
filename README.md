# melissodes-female-nesting
activity and timing of female Melissodes tepidus activity


#weather station data
Station data obtained from https://mesonet.agron.iastate.edu/request/download.phtml?network=CA_ASOS

# Investigating the Climatic Factors that Influence the Activity of the Long Horned Bee Melissodes tepida timberlakei.

# Abstract

   Native solitary bees are pollinators that help maintain the health and biodiversity of California’s native plant communities. However, there is limited research on how their behavior responds to daily weather variability. Solitary bees differ from eusocial species in that they have a short seasonal activity period, typically 1-2 months, during which they must complete foraging and nest provisioning. This period can be disrupted by unfavorable weather, reducing foraging opportunities and reproductive output. 
	This study used the solitary ground-nesting bee, Melissodes tepida timberlakei, as a model to assess responses to daily weather variation. M. tepida is active from mid-May to early July. Climatic variables, including ground temperature, ambient temperature, humidity, and cloud cover, were tested to determine their influence on foraging activity.
	Field observations were conducted over 10 days at the UC Santa Barbara Campus Lagoon, recording bee nest emergence times as a proxy for activity. Ground temperature was measured on-site while other weather data were sourced from the Muni Santa Barbara weather station via Iowa State University’s ASOS Network. Data analysis involved the use of linear-mixed effects modeling, which identified ground temperature and cloud cover as the strongest predictors of bee activity. 
	These findings highlight how daily weather conditions influence M. tepida’s activity and provide insight into how native bees may be impacted by global change. 

|Data|Description|
|:---|:---|
|bee_data.csv|Cleaned data frame of raw bee data from google sheets including columns with the parsed date under "Date", the color the bee was marked under "Bee_color", the nest number the bee emerged from under "Nest_Number", the numeric time the bee entered and exited under "Time_Entered"/"Time_Exited", the parsed time the bee entered or exited assigned either AM/PM under "Time_Entered_fixed/Time_Exited_fixed", the combined parsed dates in yy-mm-dd format with the parsed enter and exit times in 24 hour format under "Time_Entered_dt/Time_Exited_dt" (column is POSIXct class), and finally the how many minutes each bee stayed in their nest under "Duration_minutes". This data frame was created using Dr.Seltmanns fix_ampm helper function from the "clean-data-mtepidus.R" file and all rows with bee enter and exit times reported as "NA" were removed.|
|temp_data.csv|Cleaned data frame of raw ground temperature data from google sheets including columns with the parsed date in yy-mm-dd format under "Date", the numeric time the ground temperature was recorded under "Time", the recorded ground temperature in degrees fahrenheit under "ground_temperature_F", the parsed times to add AM/PM under "Time_fixed", the combined parsed dates in yy-mm-dd format with the parsed times the temperature was recorded in 24 hour format under "Time_fixed_dt" (column is POSIXct class). This data frame was created using Dr.Seltmanns fix_ampm helper function from the "clean-data-mtepidus.R".|
|bee_data_with_ground_temp.csv| Joined data using all the columns from bee_data.csv and the "ground_temperature_F column" matched by what times recorded under "Time_fixed_dt" to the closest bee exit time under "Time_Exited_dt" for each row. 
|weather-station.txt| Not a dataframe, raw weather data containing all the weather variables the weather station reports online downloaded straight from Iowa State University's ASOS Network loaded in to convert to a csv file and save as a usable dataframe.|
|new_wsd.csv| Data frame containing only the climate variables of interest from weather-station.txt. The station code name is reported under the column "station", the parsed and combined date and time (POSIXct class) corresponding to the date and time the climate variables were recorded by the weather sation under "ws_datetime", the ambient/air temperature in degrees fahrenheit under "tmpf", the relative humidity percentage under "relh", and the cloud cover category measured in oktas under "skyc1". Refer to national weather station or ISU's ASOS network for cloud cover key.|
|bee_data_for_nwsd.csv| 








