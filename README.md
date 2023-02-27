# A guide to exploring fish data and visualization a neo4j fishy DB

## Part 1: Exploring dashboard with NeoDash
The first time using this app, a warning message will pop up, asking for permission to access the graph data:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219418257-95620132-52ad-42e3-b857-7106e0ec2539.png">

You can click Yes. The data it can access are only those limited to the project "Music dataset". When opening, `NeoDash` will ask if you want to create a new dashboard, or load an existing dashboard, or connect to neo4j desktop. Since we are starting new, but we already have the data in neo4j desktop project, we can select `Connect to Neo4j Desktop`.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219420528-f66a9b1e-493e-4f26-9e04-ca1e3e9e4433.png">  

Once inside, you will be greeted with the following screen:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219765488-b10fa080-3fd3-4e9a-9555-350ac3e65f45.png"> 

#### 3.1 Loading a dashboard from JSON
If you already have a dashboard file, you can either access it from loading dashboard from neo4j, or from json files available. An example of a dashboard is available here: [`.json`](https://github.com/agiga-quanta/Neo4j-data-exploration-guide/blob/main/music_data/Music%20dataset%20dashboard.json). This is a dashboard of queries from part 3. You can download the file for this part.

On the left column, you can load the dashboard by clicking the icon shown below:   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219776702-618eec2a-78c8-49e5-8674-2ce0e82f26bc.png">

1. If you are loading from a json file, select the `Select from File` option:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219780754-439d2d66-3842-4231-8f7e-fb9948ecc201.png">  

2. NeoDash will show you a window where you can open the `.json` file you downloaded.  
