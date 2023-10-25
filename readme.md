<img align="right" width="150" height="150" src=images/w4x_logo_transparent_by_DECHEMA.png>

# Water Management and the energy transition

*We seek to stimulate a fast and sustainable energy transition while recognizing the critical value of water throughout the entire green hydrogen value chain.*

## Intro
Green hydrogen plays a key role in the defosillization of base chemicals and industrial production [1]. Despite the global potential for green hydrogen, affordable production using wind or solar energy is limited, mostly to regions the global south [2]. Unfortunately, clean water, as main resource for green hydrogen, is finite and often scarce in these regions [3]. To address these challenges, the use of multiple water source must be considered. The entire process chain from hydrogen to follow-up derivates is referred to as Power-to-X (PtX). The German research project [H2Mare](https://www.wasserstoff-leitprojekte.de/leitprojekte/h2mare) has the goal to cover the entire PtX value chain, with an additional focus on water as the primary resource for green hydrogen. The project addresses technical aspects of offshore hydrogen and PtX production, as well as knowledge transfer and upscaling.

## Objective
[Membrane distillation (MD)](https://en.wikipedia.org/wiki/Membrane_distillation) is a desalination method where water vapor passes through a hydrophobic membrane, leaving salts behind. Exothermal Power-to-X (PtX) processes release heat during energy conversions. When MD is integrated with exothermal PtX, the released heat can boost MD's performance. This integration offers enhanced water production and energy utilization efficiency.

## Goal
The interdependence of the management of water and energy is noted to date but not specifically addressed. While fresh water resources worldwide are already being overexploited, the global (green) energy transition will place additional stress on their recharge ability due to an increased application of PtX technologies. By deriving open-access models for various applications of the green hydrogen value chain, we aim to secure a fast but water-smart and sustainable energy transition.

DECHEMA has bundled various aspects of the energy transition with regard to water management in the [Water-for-X](https://dechema.de/Water_for_X.html) roadmap.



# Membrane Distillation
Membrane distillation (MD) is a separation process that employs a semi-permeable membrane to facilitate the vapor-phase transport of volatile components from a liquid feed solution to a separate vapor phase. This separation occurs due to differences in vapor pressure between the heated liquid feed and the cooler vapor side.

To simulate a 1D steady state membrane distillation, a mathematical model is typically employed [4]. This model takes into account factors like the temperature gradient across the membrane, the membrane's permeability, the flow rates of the feed and vapor streams, and the properties of the components being separated (Fig. 1). The simulation aims to predict the performance of the MD system, including factors such as flux (rate of vapor transport), selectivity (ability to separate specific components), and energy consumption.

Simulating membrane distillation is crucial for optimizing system design and operating conditions, ensuring efficient separation, and minimizing energy consumption. It helps engineers and researchers understand how changes in parameters will impact the separation process and allows for the development of cost-effective and environmentally friendly separation systems.

Estimate the permeate flux depending on the membrane characteristics, module design and operation conditions.

1. permeat flux is computed using membrane parameters
2. mass balance is applied to compute brine concentration and flow rate
3. general heat balance is applied by assuming membrane temperatures
 
Model parameters and abbreviation are clearly mentioned in the script. The Simulink model is developed with general UI to interact with the model (Fig. 2).

<img align="center" height="400" src=images/MD_SIMmodel.png>

Fig. 1, general approach

<img align="center" height="300" src=images/MD_UI.png>

Fig. 2, UI

# Files
src/Membrane_Distillation.slx (MATLAB/Simulink)

# Get in contact:
<a href="mailto:&#119;&#097;&#116;&#101;&#114;&#064;&#100;&#101;&#099;&#104;&#101;&#109;&#097;&#046;&#100;&#101;">Send us a Mail</a>

---
# Source
[1] [Geres, R., Kohn, A., Lenz, S. C., Ausfelder, F., Bazzanella, A., Möller, A., (2019). Future Camp Climate GmbH, DECHEMA, Roadmap Chemie 2050 auf dem Weg zu einer treibhausgasneutralen chemischen Industrie in Deutschland, ISBN: 978-3-89746-223-6](https://dechema.de/chemie2050-path-123211,124930.html)

[2] [The Future of Hydrogen, IEA, Technology report 2019](https://www.iea.org/reports/the-future-of-hydrogen)

[3] [Water Risk Institute (WRI), Aqueduct (2019). Overall water risk](https://www.wri.org/applications/aqueduct/water-risk-atlas/#/?advanced=false&basemap=hydro&indicator=w_awr_def_tot_cat&lat=-14.445396942837744&lng=-142.85354599620152&mapMode=view&month=1&opacity=0.5&ponderation=DEF&predefined=false&projection=absolute&scenario=optimistic&scope=baseline&timeScale=annual&year=baseline&zoom=2)

[4] Ameen, N.A.M.; Ibrahim, S.S.; Alsalhy, Q.F.; Figoli, A. Highly Saline Water Desalination Using Direct Contact Membrane Distillation (DCMD): Experimental and Simulation Study. Water 2020, 12, 1575. https://doi.org/10.3390/w12061575 
