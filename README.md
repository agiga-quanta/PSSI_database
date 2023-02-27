# A guide to exploring PSSI database and visualizing with `NeoDash`

## Part 1: Launching dashboard with NeoDash
The first time using this app, a warning message will pop up, asking for permission to access the graph data:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219418257-95620132-52ad-42e3-b857-7106e0ec2539.png">

You can click Yes. The data it can access are only those limited to the project. When opening, `NeoDash` will ask if you want to create a new dashboard, or load an existing dashboard, or connect to neo4j desktop. `NeoDash` itself is just a tool to use `neo4j`, hence you will have to connect to a `neo4j` desktop project, we can select `Connect to Neo4j Desktop`.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219420528-f66a9b1e-493e-4f26-9e04-ca1e3e9e4433.png">  

Once inside, you will be greeted with the following screen:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219765488-b10fa080-3fd3-4e9a-9555-350ac3e65f45.png"> 

### 1.1 Loading a dashboard from JSON
If you already have a dashboard file, you can either access it from loading dashboard from neo4j, or from json files available. An example of a dashboard is available here: [`.json`](). This is a dashboard of queries from part 3. You can download the file for this part.

On the left column, you can load the dashboard by clicking the icon shown below:   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219776702-618eec2a-78c8-49e5-8674-2ce0e82f26bc.png">

1. If you are loading from a json file, select the `Select from File` option:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219780754-439d2d66-3842-4231-8f7e-fb9948ecc201.png">  

2. NeoDash will show you a window where you can open the `.json` file you downloaded.  

3. In addition to that, you can also copy and paste the text within the `.json` file into the area below.

4. Click `LOAD DASHBOARD` to load the preset

## Part 2: Using the preset "Lineage Tracking" dashboard

### 2.1 Main Page

Within the dahsboard, you will be greeted with the `Main Page`. Here, you are instructed to import the data from the file given. You can click on the `play` button to import data. The output show will be `-1`, and this is normal.

You can now navigate to other pages to explore and visualize

### 2.2 Finding the shortest path between two nodes
This page lets you chooose two nodes to find the shortest path between them. 

Simply type the acronym of the starting node in the `Starting node` box, select the correct acronym, and do the same for `Ending node`. The result will be shown in the report below.


### 2.3 Finding all path between two nodes
This page lets you chooose two nodes to find all the paths between them. 

Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box, select the correct acronym, and do the same for `Ending node`. The result will be shown in the report below. 


### 2.4 Finding all shortest path to one node
This idea comes from combining the previous two ideas. By selecting a starting node, the output will show all nodes connected to it and also the shortest path. 

Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box. The result will be shown in the report on the right. 


### 2.5 Finding all distinct, directed, and connected node to one node
If you do not want a graph, this idea can show the lists of distinct but connected nodes in the graph. By selecting a starting node, the output will show all nodes connected to it

Similar instruction to previous section, simply type the acronym of the starting node in the `Starting node` box. The result will be shown in the report on the right. 

### 2.6 Finding all connected nodes, within a certain length
Sometimes, in a very big graph, you only want to see the neighboring nodes of a node. To see the relationship between each other, you can use this graph. 

To find the visualization of which node is connected to the `Starting node`, simply type the acronym of the starting node in the `Starting node` box, and specify the length of connection to it. 1 would mean its direct neighbor, 2 would expand one more beyond it. The example below is length 3. That's why you can see nodes such as `PAC_ADMIN`, `REFDATA`. The result will be shown in the report on the right. 

### 2.7 Finding all nodes, within a certain length, NODES only
In complementary to previous graph, this is one without the relationship showing, only nodes. 

Simply type the acronym of the starting node in the `Starting node` box, and specify the length of connection to it. 1 would mean its direct neighbor, 2 would expand one more beyond it. The example below is length 3. That's why you can see nodes such as `PAC_ADMIN`, `REFDATA`. The result will be shown in the report on the right. 

