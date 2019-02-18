

```python
import random
import sys
import math
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from citipy import citipy
import openweathermapy.core as owm
from config import api_key
import seaborn as sns

xL=[]
yL=[]
cities = []
counties = []

radius = 19065000                         
radiusInDegrees=radius/111300            
r = radiusInDegrees
x0 = 0
y0 = 10

for i in range(4000):
    u = float(random.uniform(0.0,1.0))
    v = float(random.uniform(0.0,1.0))
    w = r * math.sqrt(u)
    t = 2 * math.pi * v
    x = w * math.cos(t) 
    y = w * math.sin(t) *0.4
    xLat  =x + x0 
    yLong = y + y0
    xL.append(xLat)
    yL.append(yLong)
    city = citipy.nearest_city(xLat,yLong)
    cities.append(city.city_name)
    counties.append(city.country_code)
```


```python
plt.scatter(xL,yL)
plt.show()
#print(len(counties),len(cities))
cities = list(set(cities))
print(len(cities))
```


![png](output_1_0.png)


    805



```python
settings = {"units": "metric", "appid": api_key}
weather_data = []
data = []
full_data = []
for city in cities:
    try:
        weather_data = [owm.get_current(city, **settings)]
        summary = ['main.temp','main.humidity','wind.speed','clouds.all','sys.country','name','coord.lat','coord.lon']
        data = [response(*summary) for response in weather_data]
        full_data.append(data)
    except:
        #print('"%s" city is not found'%(city))
        cities.remove(city)
print(len(cities))
print(cities)
```

    717
    ['brae', 'tokmak', 'kokstad', 'oussouye', 'mogadishu', 'trairi', 'gabu', 'exaplatanos', 'synya', 'jaciara', 'dutse', 'almenara', 'tasiilaq', 'aksarka', 'kochi', 'abalak', 'navodari', 'bredasdorp', 'ribeira do pombal', 'damietta', 'luau', 'dmitriyevka', 'verkhnyaya toyma', 'arona', 'anloga', 'krasnyy yar', 'bindura', 'dori', 'nouadhibou', 'victoria', 'awbari', 'humberto de campos', 'atar', 'umm kaddadah', 'pelym', 'kyabe', 'pombia', 'magaria', 'mahebourg', 'concepcion', 'nkhata bay', 'manjeshwar', 'lambarene', 'goba', 'votkinsk', 'ballina', 'saint-francois', 'correntina', 'port-gentil', 'lagoa', 'nara', 'abu ghosh', 'kolvereid', 'bonito', 'yomou', 'tukums', 'rumphi', 'chapayeve', 'goderich', 'eydhafushi', 'torbeyevo', 'qaqortoq', 'nybro', 'mehamn', 'necochea', 'krasnoarmeyskoye', 'fort-shevchenko', 'passo fundo', 'harper', 'menongue', 'nalut', 'opuwo', 'paso de los toros', 'svetlyy yar', 'nizwa', 'walvis bay', 'suez', 'inta', 'sumbe', 'cap malheureux', 'dossor', 'abu samrah', 'tanout', 'okahandja', 'bandar-e lengeh', 'carnot', 'dingle', 'sao jose da coroa grande', 'minas', 'paamiut', 'extremoz', 'beisfjord', 'tambura', 'conceicao do araguaia', 'durban', 'makurdi', 'mont-de-marsan', 'karema', 'floro', 'torbay', 'sagana', 'valenca', 'joniskelis', 'asosa', 'warri', 'madimba', 'matay', 'abha', 'koubia', 'slavutych', 'taoudenni', 'marawi', 'karpathos', 'adamas', 'richards bay', 'saldanha', 'oudtshoorn', 'yokadouma', 'magole', 'derzhavinsk', 'jadu', 'toftir', 'havoysund', 'grays', 'winneba', 'gornopravdinsk', 'rabo de peixe', 'kavaratti', 'barbar', 'kikwit', 'moussoro', 'balkanabat', 'yekimovichi', 'phalodi', 'aranos', 'gambela', 'inongo', 'ampanihy', 'ponta do sol', 'noto', 'sao felix do xingu', 'malente', 'bonthe', 'maragogi', 'conakry', 'voyinka', 'shumikha', 'ambilobe', 'apsheronsk', 'storforshei', 'tenenkou', 'choma', 'camacupa', 'cidreira', 'tromso', 'itaituba', 'velykoploske', 'bubaque', 'ierapetra', 'arraial do cabo', 'kushalgarh', 'zwedru', 'cocobeach', 'briancon', 'sinnamary', 'campos', 'mongoumba', 'farafangana', 'lodeynoye pole', 'neka', 'salinopolis', 'kurikka', 'cerrik', 'rafai', 'mezhdurechensk', 'wad rawah', 'oranjemund', 'ipameri', 'chipinge', 'vila franca do campo', 'tabou', 'olinda', 'rwamagana', 'cefalu', 'bila krynytsya', 'techiman', 'nanortalik', 'faya', 'koyelga', 'petrovskoye', 'lithakia', 'cervo', 'kibala', 'sheksna', 'vestmanna', 'morondava', 'garlasco', 'masunga', 'hyeres', 'sao joao da barra', 'codrington', 'solwezi', 'maceio', 'priyutnoye', 'mangalia', 'baarle-hertog', 'berlevag', 'yuzhno-sukhokumsk', 'sao miguel do araguaia', 'melfi', 'porto tolle', 'valjala', 'zimandu nou', 'port elizabeth', 'buraydah', 'bonfim', 'porbandar', 'alibag', 'inhambane', 'najran', 'jalu', 'orikum', 'cayenne', 'lagos', 'ponta delgada', 'grindavik', 'ngaoundere', 'costa rica', 'hounde', 'georgiyevka', 'straumen', 'ouallam', 'sidi ali', 'vagur', 'ejea de los caballeros', 'thinadhoo', 'thiers', 'rovinj', 'arlit', 'maputo', 'lukovetskiy', 'camacha', 'bousse', 'vultureni', 'pellerd', 'tupaciguara', 'praia', 'nesna', 'sur', 'belmonte', 'rorvik', 'santa cruz de tenerife', 'yarim', 'luis correia', 'nisia floresta', 'bataipora', 'stykkisholmur', 'alta floresta', 'suraabad', 'gorgan', 'kaffrine', 'santa helena', 'valreas', 'chanika', 'ahja', 'makat', 'abu kamal', 'marzuq', 'nioro', 'khudumelapye', 'diamantino', 'klaksvik', 'kibaya', 'mbekenyera', 'zhanaozen', 'quatre cocos', 'gamba', 'ribeira grande', 'pontal do parana', 'salalah', 'dzaoudzi', 'dodoma', 'ratnagiri', 'novoorsk', 'ormara', 'keuruu', 'dehloran', 'kisangani', 'koutsouras', 'sorland', 'arzachena', 'candolim', 'mezen', 'beyneu', 'paracuru', 'dwarka', 'solenzo', 'skibbereen', 'uray', 'laguna', 'buzdyak', 'fereydunshahr', 'chimoio', 'iskateley', 'sao francisco', 'murmashi', 'zadar', 'monte carmelo', 'oeiras do para', 'touros', 'shakhtinsk', 'gat', 'margate', 'aktau', 'cururupu', 'betera', 'bay roberts', 'porto novo', 'bambous virieux', 'vestmannaeyjar', 'alta', 'gourdon', 'sindor', 'takoradi', 'qeshm', 'luanda', 'vyartsilya', 'adrar', 'santa rita', 'weiden', 'forssa', 'davlekanovo', 'saint-gaudens', 'bara', 'ilulissat', 'ughelli', 'santa maria', 'maxixe', 'aloja', 'sainte-maxime', 'presidente epitacio', 'cavalcante', 'conde', 'muriti', 'tiznit', 'zabol', 'kaduqli', 'bathsheba', 'sao sebastiao', 'manisa', 'kosovo polje', 'mzimba', 'aviles', 'mayumba', 'wamba', 'kirovsk', 'buchanan', 'camabatela', 'georgetown', 'nikolsk', 'bud', 'oriximina', 'hermanus', 'djambala', 'kharp', 'uige', 'gobabis', 'biltine', 'apodi', 'duiwelskloof', 'darab', 'ravar', 'chuy', 'loyga', 'jacareacanga', 'saint-philippe', 'sabya', 'senanga', 'shuyskoye', 'chornukhy', 'ponnani', 'hobyo', 'henties bay', 'zambezi', 'ludvika', 'jacqueville', 'kulhudhuffushi', 'sayyan', 'tucurui', 'gurlan', 'talas', 'lesnoy', 'aswan', 'owando', 'temir', 'boali', 'kashan', 'alagoinhas', 'roald', 'pio ix', 'umm lajj', 'vieste', 'vangaindrano', 'lulea', 'lodja', 'biscarrosse', 'pompeu', 'vila velha', 'marrakesh', 'doka', 'arenapolis', 'canico', 'kajaani', 'polunochnoye', 'kontagora', 'saint-leu', 'hatod', 'oktyabrskiy', 'grand gaube', 'a', 'dakar', 'puerto del rosario', 'badhni kalan', 'periyapatti', 'subottsi', 'alto araguaia', 'jabinyanah', 'igra', 'nortelandia', 'antalaha', 'bojnurd', 'spitsevka', 'kirkenaer', 'bandundu', 'khash', 'gravdal', 'khor', 'sarab', 'funtua', 'evinayong', 'knysna', 'colesberg', 'bereda', 'hithadhoo', 'killybegs', 'nossa senhora das dores', 'mana', 'maniitsoq', 'chiredzi', 'shetpe', 'araouane', 'birao', 'soest', 'ust-kulom', 'kindu', 'pechenga', 'mezica', 'segezha', 'lieksa', 'tessalit', 'mahibadhoo', 'maldonado', 'saint-georges', 'syracuse', 'upernavik', 'saint-joseph', 'chingola', 'scottsburgh', 'yar-sale', 'kisanga', 'kazanskaya', 'longyearbyen', 'storozhevaya', 'bongandanga', 'nikel', 'merke', 'shakawe', 'flic en flac', 'robertsport', 'shahrud', 'moengo', 'skjervoy', 'namibe', 'krutinka', 'semnan', 'pandamatenga', 'husyatyn', 'maloshuyka', 'peruibe', 'irtyshskiy', 'meghri', 'marsa matruh', 'lavumisa', 'ushuaia', 'djibo', 'souillac', 'los llanos de aridane', 'bonavista', 'tevriz', 'brenes', 'aden', 'bad laasphe', 'taraz', 'witbank', 'arys', 'klooga', 'toledo', 'farap', 'badamdar', 'sawakin', 'alvorada', 'kruisfontein', 'emirdag', 'lamu', 'port alfred', 'wukari', 'adilpur', 'dalbandin', 'mecca', 'bilma', 'pinega', 'plettenberg bay', 'praia da vitoria', 'saint anthony', 'businga', 'toliary', 'aquiraz', 'troitsko-pechorsk', 'kovernino', 'coldingham', 'camocim', 'itarema', 'bloemfontein', 'ginir', 'tigzirt', 'kasongo-lunda', 'muros', 'biograd na moru', 'batangafo', 'stow', 'bauchi', 'bronnoysund', 'mangrol', 'caravelas', 'hofn', 'tala', 'wete', 'baherden', 'bandarbeyla', 'pudozh', 'veraval', 'garowe', 'sistranda', 'panjakent', 'vardo', 'sambava', 'amderma', 'khanpur', 'gilgit', 'piterka', 'aksum', 'hargeysa', 'luderitz', 'imbituba', 'atbasar', 'beroroha', 'catalina', 'hudiksvall', 'zvishavane', 'beira', 'omboue', 'kayes', 'montevideo', 'lakki marwat', 'kamenka', 'iisaku', 'tibiri', 'porosozero', 'palaikastron', 'ventspils', 'vikulovo', 'lubao', 'soyo', 'orel', 'kutum', 'husavik', 'riyadh', 'alghero', 'mwinilunga', 'saint-pierre', 'aknada', 'sabha', 'rauma', 'bhan', 'jamestown', 'jacobabad', 'george', 'nokaneng', 'lugo', 'raul soares', 'nouakchott', 'dikson', 'lerwick', 'quelimane', 'voi', 'koygorodok', 'gazanjyk', 'kasangulu', 'tiel', 'cabinda', 'sovetskiy', 'awjilah', 'cascais', 'belchatow', 'zhanakorgan', 'bjornevatn', 'carnarvon', 'ashford', 'east london', 'camopi', 'gunjur', 'mananjary', 'ondjiva', 'chervonohryhorivka', 'nizhniy tagil-39', 'nurota', 'eyl', 'yabrud', 'kaniama', 'marystown', 'fez', 'goma', 'serra', 'grand-santi', 'assare', 'yahotyn', 'mugumu', 'campina verde', 'saint george', 'kathu', 'nuuk', 'kilindoni', 'artyom', 'florianopolis', 'slavsk', 'mwanza', 'mar del plata', 'mlyniv', 'pervomaysk', 'gazli', 'paragominas', 'maracacume', 'honningsvag', 'amlame', 'mtsamboro', 'cabedelo', 'doha', 'vilhena', 'manama', 'cape town', 'kuvshinovo', 'imeni babushkina', 'kochevo', 'ugoofaaru', 'beboto', 'rocha', 'aras', 'coxim', 'qasigiannguit', 'jardim', 'siniscola', 'sao filipe', 'arucas', 'mola di bari', 'ceres', 'kudahuvadhoo', 'ouadda', 'cuamba', 'naryan-mar', 'uporovo', 'pachelma', 'bom jesus do itabapoana', 'dabakala', 'siva', 'beloha', 'kalaleh', 'rio grande', 'tamandare', 'rio do sul', 'lere', 'guarapari', 'axim', 'mazagao', 'limoux', 'aconibe', 'kengyel', 'grabouw', 'bad windsheim', 'atasu', 'karad', 'durazno', 'doorn', 'tarquinia', 'carutapera', 'eyrarbakki', 'manacor', 'ginda', 'ovruch', 'karasburg', 'yorosso', 'pizhma', 'ijui', 'chingirlau', 'ostrovnoy', 'luba', 'goksun', 'sikasso']



```python
weather_df = pd.DataFrame(full_data)
weather_df = weather_df[0].apply(pd.Series)
weather_df.columns = ['Temperature (F)', 'Humidity (%)','Wind Speed (mph)','Cloudiness (%)','Country','City Name','Lat','Lon']

weather_df.to_csv("weather_for_random_city.csv", index=False, header=True)
weather_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Temperature (F)</th>
      <th>Humidity (%)</th>
      <th>Wind Speed (mph)</th>
      <th>Cloudiness (%)</th>
      <th>Country</th>
      <th>City Name</th>
      <th>Lat</th>
      <th>Lon</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10.00</td>
      <td>71</td>
      <td>10.80</td>
      <td>75</td>
      <td>GB</td>
      <td>Brae</td>
      <td>60.40</td>
      <td>-1.35</td>
    </tr>
    <tr>
      <th>1</th>
      <td>33.93</td>
      <td>19</td>
      <td>3.46</td>
      <td>0</td>
      <td>UA</td>
      <td>Tokmak</td>
      <td>47.26</td>
      <td>35.70</td>
    </tr>
    <tr>
      <th>2</th>
      <td>20.93</td>
      <td>29</td>
      <td>3.11</td>
      <td>0</td>
      <td>ZA</td>
      <td>Kokstad</td>
      <td>-30.55</td>
      <td>29.42</td>
    </tr>
    <tr>
      <th>3</th>
      <td>29.53</td>
      <td>74</td>
      <td>3.10</td>
      <td>40</td>
      <td>SN</td>
      <td>Oussouye</td>
      <td>12.49</td>
      <td>-16.54</td>
    </tr>
    <tr>
      <th>4</th>
      <td>29.00</td>
      <td>79</td>
      <td>7.70</td>
      <td>20</td>
      <td>SO</td>
      <td>Mogadishu</td>
      <td>2.04</td>
      <td>45.34</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Temperature (F) vs. Latitude
sns.set_context("notebook", font_scale=1.6)
sns.set_style("darkgrid")  #ticks
sns.lmplot('Lat', # Horizontal axis
           'Temperature (F)', # Vertical axis
           data=weather_df, # Data source
           fit_reg=False,legend=False, # Don't fix a regression line
           hue='Lon',aspect=1.4,scatter_kws={"s" :weather_df['Humidity (%)'],'alpha':0.6,'edgecolors':"black",'linewidth':2}) # Set color # S marker size
plt.xlabel("Latitude")
plt.ylabel("Temperature (F)")
plt.title("City Latitude vs.Temperature (F)")
plt.savefig("Temperature.png")
plt.show()
```


![png](output_4_0.png)



```python
#Humidity (%) vs. Latitude
sns.set_context("notebook", font_scale=1.6)
sns.set_style("darkgrid")  #ticks
sns.lmplot('Lat', # Horizontal axis
           'Humidity (%)', # Vertical axis
           data=weather_df, # Data source
           fit_reg=False,legend=False, # Don't fix a regression line
           hue='Lon',aspect=1.4,scatter_kws={"s" :weather_df['Cloudiness (%)'],'alpha':0.6,'edgecolors':"black",'linewidth':2}) # Set color # S marker size
plt.xlabel("Latitude")
plt.ylabel("Humidity (%)")
plt.title("City Latitude vs.Humidity (%)")
plt.savefig("Humidity (%).png")
plt.show()

```


![png](output_5_0.png)



```python
#Cloudiness (%) vs. Latitude
sns.set_context("notebook", font_scale=1.6)
sns.set_style("darkgrid")  #ticks
sns.lmplot('Lat', # Horizontal axis
           'Cloudiness (%)', # Vertical axis
           data=weather_df, # Data source
           fit_reg=False,legend=False, # Don't fix a regression line
           hue='Lon',aspect=1.4,scatter_kws={"s" :weather_df['Humidity (%)'],'alpha':0.6,'edgecolors':"black",'linewidth':2}) # Set color # S marker size
plt.xlabel("Latitude")
plt.ylabel("Cloudiness (%)")
plt.title("City Latitude vs.Cloudiness (%)")
plt.savefig("Cloudiness.png")
plt.show()

```


![png](output_6_0.png)



```python
#Wind Speed (mph) vs. Latitude
#Cloudiness (%) vs. Latitude
sns.set_context("notebook", font_scale=1.6)
sns.set_style("darkgrid")  #ticks
sns.lmplot('Lat', # Horizontal axis
           'Wind Speed (mph)', # Vertical axis
           data=weather_df, # Data source
           fit_reg=False,legend=False, # Don't fix a regression line
           hue='Lon',aspect=1.4,scatter_kws={"s" :weather_df['Humidity (%)'],'alpha':0.6,'edgecolors':"black",'linewidth':2}) # Set color # S marker size
plt.xlabel("Latitude")
plt.ylabel("Wind Speed (mph)")
plt.title("City Latitude vs.Wind Speed (mph)")
plt.savefig("Wind_speed.png")
plt.show()
```


![png](output_7_0.png)

