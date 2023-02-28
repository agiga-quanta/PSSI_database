# A guide to import PSSI database, and visualize the database with [`NeoDash`](https://neo4j.com/developer-blog/neodash-2-0-a-brand-new-way-to-visualize-neo4j/)
This is a guide to importing, and visualizing PSSI database with a `NeoDash` dashboard preset given. To fully follow the guide, you will need to already have the data. The dashboard preset can be downloaded [here](https://github.com/agiga-quanta/PSSI_database/blob/main/NeoDash/NeoDash_fish_preset.json). In case you need a refresh on how to install NeoDash, click [here to be taken to a guide to install NeoDash](https://github.com/agiga-quanta/Neo4j-data-exploration-guide#part-2-setting-up-dataset-in-neo4j)

## Part 1: Importing data into `neo4j`
Since our dataset are already made above in csv files, you can import them into the project by following the steps below:
- Select the `...` option  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221722925-6c8227f6-95db-40d6-8430-186aea79b22c.png">

- Follow the path to `Open folder` -> `Imports`  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221722969-2313de06-4b8d-48ec-9d0b-d395ae5aac39.png">

You will be greeted with this window, where you can put your import files here to use in `neo4j desktop`. Once done, you can close the window.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221723006-10f64ff7-b05c-479a-bc22-1ddbc194d588.png">

## Part 2: Launching dashboard with NeoDash
To begin with, you will have to start a project in neo4j. 
The first time using this app, a warning message will pop up, asking for permission to access the graph data:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219418257-95620132-52ad-42e3-b857-7106e0ec2539.png">

You can click `Yes - Install`. The data it can access are only those limited to the project. When opening, `NeoDash` will ask if you want to create a new dashboard, or load an existing dashboard, or connect to neo4j desktop. `NeoDash` itself is just a tool to use `neo4j`, hence you will have to connect to a `neo4j` desktop project, we can select `Connect to Neo4j Desktop`.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219420528-f66a9b1e-493e-4f26-9e04-ca1e3e9e4433.png">  

Once inside, you will be greeted with the following screen:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219765488-b10fa080-3fd3-4e9a-9555-350ac3e65f45.png"> 

### 2.1 Loading a dashboard from JSON
If you already have a dashboard file, you can either access it from loading dashboard from neo4j, or from json files available.  
On the left column, you can load the dashboard by clicking the icon shown below:   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219776702-618eec2a-78c8-49e5-8674-2ce0e82f26bc.png">

If you are loading from a json file, select the `Select from File` option:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219780754-439d2d66-3842-4231-8f7e-fb9948ecc201.png">  

NeoDash will show you a window where you can open the `NeoDash_fish_preset.json` file you downloaded.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221700286-bf5ed28f-29fa-4b3b-b9bc-0dfb276eb36a.png"> 

In addition to that, you can also copy and paste the text within the `.json` file into the area below. Click `LOAD DASHBOARD` to load the preset.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221699854-239aa186-c9d8-46aa-8627-2b808eb8d99c.png"> 

## Part 3: Using the preset "Lineage Tracking" dashboard

### 3.1 Main Page  
Within the dashboard, you will be greeted with the `Main Page`. Here, you are instructed to import the data from the file given. You can click on the `play` button to import data. The output show will be `-1`, and this is normal.  You can now navigate to other pages to explore.
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221699191-ce849dd4-5914-447f-bfb1-30c591d17899.png"> 

### 3.2 Finding the shortest path between two nodes
This page lets you chooose two nodes to find the shortest path between them.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221698974-9b3547b8-9200-46ac-8fc5-8d16db5aaad4.png">

Simply type the acronym of the starting node in the `Starting node` box, select the correct acronym
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221699077-8c5c98b3-253f-40d2-b1ed-37942adbb48c.png">  

You can also do the same for `Ending node`. As you can see, the changes you make here is reflected immediately below in the graph. The result will be shown in the report below.    
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221702141-fe266949-d376-4ccd-93d2-f549c9e3315c.png">  

### 3.3 Finding all path between two nodes
This page lets you chooose two nodes to find all the paths between them. Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box, select the correct acronym, and do the same for `Ending node`. The result will be shown in the report below.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221718823-018a4320-d043-43a2-93af-7e289bb5d7aa.png">  

### 3.4 Finding all shortest path to one node
This idea comes from combining the previous two ideas. By selecting a `Starting node`, the output will show all nodes connected to it and also their respective shortest paths. Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box. The result will be shown in the report on the right.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221718913-3d59518b-461f-4e5e-a993-cd88d0c8ca28.png">

### 3.5 Finding all distinct, directed, and connected node to one node
If you do not want a graph, this idea can show the lists of distinct but connected nodes in the graph. By selecting a starting node, the output will show all nodes connected to it. Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box. The result will be shown in the report below.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221718974-03b40c01-161e-4eb0-92c7-29dea28a8239.png">

### 3.6 Finding all connected nodes, within a certain length
Sometimes, in a very big graph, you only want to see the neighboring nodes of a node. To see the relationship between each other, you can use this graph. To find the visualization of which node is connected to the `Starting node`, simply type the acronym of the starting node in the `Starting node` box, and specify the `Length` of connection to it. 1 would mean its direct neighbor, 2 would expand one more beyond it. The example below is length 3. That's why you can see nodes such as `PAC_ADMIN`, `REFDATA`. The result will be shown in the report on the right.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221719118-281a8b01-adf4-4fc5-a16a-cde0573aa3c7.png">

### 3.7 Finding all nodes, within a certain length, NODES only
In complementary to previous graph, this is one without the relationship showing, only nodes. Simply type the acronym of the starting node in the `Starting node` box, and specify the `Length` of connection to it. 1 would mean its direct neighbor, 2 would expand one more beyond it. The example below is length 3. That's why you can see nodes such as `PAC_ADMIN`, `REFDATA`. The result will be shown in the report on the right. This graph is usually the hardest to see by default. However, you can zoom and move the nodes around for better presentation.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221719209-aef9cdc3-ee03-4869-8da6-bcb61a774cc7.png">

