library(httptest2)


abstr <- 'Congressional district lines in many U.S. states are drawn by partisan
actors, raising concerns about gerrymandering. To separate the partisan effects
of redistricting from the effects of other factors including geography and
redistricting rules, we compare possible party compositions of the U.S. House
under the enacted plan to those under a set of alternative simulated plans
that serve as a non-partisan baseline. We find that partisan gerrymandering
is widespread in the 2020 redistricting cycle, but most of the electoral bias
it creates cancels at the national level, giving Republicans two additional
seats on average. Geography and redistricting rules separately contribute a
moderate pro-Republican bias. Finally, we find that partisan gerrymandering
reduces electoral competition and makes the partisan composition of the U.S. House
less responsive to shifts in the national vote.'

abstr <- gsub('\\n', ' ', abstr) # remove the "\n"s

fake_abstr <- 'The 2020 congressional redistricting process in the United States
has been marked by widespread partisan gerrymandering, which has led to concerns
about its impact on electoral outcomes and democratic representation. This paper
examines the effects of partisan gerrymandering on electoral competition in the
2020 congressional elections. Using data from previous election cycles and
simulations of the 2020 elections, we find that while partisan gerrymandering
mostly cancels out at the national level, it reduces competition in individual
districts, making them less competitive and reducing voter choice. We also find
that the impact of gerrymandering on electoral outcomes varies significantly
by state and political party, suggesting that redistricting can have significant
implications for democratic representation and political power in the United
States. The findings of this study have important implications for policymakers,
as well as advocates of fair and democratic elections.'

fake_abstr <- gsub('\\n', ' ', fake_abstr) # remove the "\n"s

tf_fake <- tempfile(fileext = '.txt')
cat(fake_abstr, file = tf_fake)
