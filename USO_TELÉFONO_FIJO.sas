
/* Muestreo de los datos */

title 'Uso del teléfono fijo en los hogares españoles';
data telefono_fijo;
input tamano_hogar $ 1-16 year_2023 year_2022 year_2021 year_2020 year_2019 year_2018 year_2017 year_2016 year_2015 year_2014 year_2013 year_2012 year_2011 year_2010 year_2009 year_2008 year_2007 year_2006;
datalines;
Total_Viviendas      57.5 62.5 67.2 71.1 74.9 75.8 77.6 78.5 78.4 78.2 77.9 79.2 80.1 79.8 79.8 80.8 80.7 82.8 .
1_miembro            45.3 47.7 52.3 55.9 60.5 60.9 64.0 64.0 64.9 66.2 63.6 65.2 68.9 66.4 67.9 70.4 70.1 74.1 .
2_miembros           60.8 65.8 70.6 73.2 75.4 77.5 78.9 80.7 80.3 81.0 82.0 82.5 82.5 82.8 82.0 83.4 82.3 83.6 .
3_miembros           62.9 69.1 71.3 75.9 81.1 81.0 82.9 82.9 81.5 80.7 80.4 81.8 82.9 82.1 80.8 82.1 82.6 84.4 .
4_miembros           61.2 66.7 72.4 77.9 81.9 82.3 83.4 84.0 84.2 82.4 81.6 83.7 84.1 84.2 84.4 83.9 84.8 86.4 .
5_o_mas_miembros     57.2 63.7 71.1 70.8 73.6 74.7 75.6 77.5 80.1 76.2 76.1 76.9 76.5 78.2 81.0 80.1 80.3 82.5 .
;
run;

proc print data=telefono_fijo; 
run;


proc sort data = telefono_fijo;
by tamano_hogar;
run;
proc means data = telefono_fijo mean;
by tamano_hogar;
run;



/*Análisis descriptivo general básico*/

title'Análisis descriptivo general básico';
proc means data=telefono_fijo  n mean var std max min range cv skewness kurtosis;
run;


/* disminución por año en media */

data datos;
input year media_porcentaje;
cards;
2006 82.3
2007 80.13
2008 80.11
2009 79.31
2010 78.91
2011 79.16
2012 78.21
2013 76.93
2014 77.45
2015 78.23
2016 77.93
2017 77.06
2018 75.36
2019 74.56
2020 70.8
2021 67.48
2022 62.58
2023 57.48
;
proc print data = datos; run;


title "Evolución del uso de teléfono fijo en los hogares españoles por año";
symbol v = dot i = j;
proc gplot data = datos;
plot media_porcentaje * year;
run;


proc sgplot data=datos;
   vbar year / response=media_porcentaje group=year datalabel;
   xaxis grid;
   yaxis grid;
   title "Histograma del Uso del Teléfono Fijo en España por Año";
run;





/* gráfico por tamaño y año */

data year;
input year uno dos tres cuatro cinco_o_mas;
cards;

2006  74.1  83.6  84.4  86.4  82.5
2007  70.1  82.3  82.6  84.8  80.3
2008  70.4  83.9  82.1  83.4  82.5
2009  67.9  82.0  80.8  84.4  80.1
2010  66.4  82.8  82.1  84.2  78.2
2011  68.9  82.5  82.9  84.1  76.5
2012  65.2  82.5  81.8  83.7  76.9
2013  63.6  82.0  80.4  81.6  76.1
2014  66.2  81.0  80.7  82.4  76.2
2015  64.9  80.3  81.5  84.2  80.1
2016  64.0  80.7  82.9  84.0  77.5
2017  64.0  78.9  82.9  83.4  75.6
2018  60.9  77.5  81.0  82.3  74.7
2019  60.5  75.4  81.1  81.9  73.6
2020  55.9  73.2  75.9  77.9  70.8
2021  52.3  70.6  71.3  72.4  71.1
2022  47.7  65.8  69.1  66.7  63.7
2023  45.3  60.8  62.9  61.2  57.2

;
proc print data = year; run;

title 'Evolución del uso del teléfono fijo en hogares de 1 persona';
symbol v = dot i = j;
proc gplot data = year;
plot (uno) * year;
run;


title 'Evolución del uso del teléfono fijo en hogares de 2 personas';
symbol v = dot i = j;
proc gplot data = year;
plot (dos) * year;
run;


title 'Evolución del uso del teléfono fijo en hogares de 3 personas';
symbol v = dot i = j;
proc gplot data = year;
plot (tres) * year;
run;



title 'Evolución del uso del teléfono fijo en hogares de 4 personas';
symbol v = dot i = j;
proc gplot data = year;
plot (cuatro) * year;
run;



title 'Evolución del uso del teléfono fijo en hogares de 5 ó más personas';
symbol v = dot i = j;
proc gplot data = year;
plot (cinco_o_mas) * year;
run;




/*graficos-HISTOGRAMAS*/
title ' Histograma del uso del teléfono fijo por tamaño de hogar en 2023';
proc gchart data=telefono_fijo;
hbar tamano_hogar /sumvar=year_2023;run; 

title 'Histograma del uso del teléfono fijo por tamaño de hogar en 2006';
proc gchart data=telefono_fijo;
hbar tamano_hogar /sumvar=year_2006;run;


/* CORRELACION AÑO USO*/

data telefonos;
   input year uso;
   datalines;
2006 82.3
2007 80.13
2008 80.11
2009 79.31
2010 78.91
2011 79.16
2012 78.21
2013 76.93
2014 77.45
2015 78.23
2016 77.93
2017 77.06
2018 75.36
2019 74.56
2020 70.8
2021 67.48
2022 62.58
2023 57.48
;
run;

proc sgplot data=telefonos;
   scatter x=year y=uso / datalabel=year;
   reg x=year y=uso / lineattrs=(color=blue);
   xaxis grid;
   yaxis grid;
   title "Regresión del Uso del Teléfono Fijo en España (2006-2023)";
run;


proc corr data=telefonos pearson;
   var year uso;
   title "Correlación de Pearson entre el Año y el Uso del Teléfono Fijo en España";
run;



/* CORRELACION TAMAÑO USO*/


data correlacion_2;
input tamano  uso_medio_por_tamano;
cards;
1  64.294
2  76.872
3  80.022
4  82.605
5  75.944
;
run;
proc print data = correlacion_2; run;


proc corr data=correlacion_2 pearson;
   var tamano uso_medio_por_tamano;
run;


proc sgplot data=correlacion_2;
   scatter x=tamano y=uso_medio_por_tamano / datalabel=tamano;
   reg x=tamano y=uso_medio_por_tamano / lineattrs=(color=blue);
   xaxis grid;
   yaxis grid;
   title "Regresión del Uso del Teléfono Fijo en España por tamaño de hogar";
run;
