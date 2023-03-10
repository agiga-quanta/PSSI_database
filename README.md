# A guide to import PSSI database, and visualize the database with [`NeoDash`](https://neo4j.com/developer-blog/neodash-2-0-a-brand-new-way-to-visualize-neo4j/)
This is a guide to importing, and visualizing PSSI database with a `NeoDash` dashboard preset given. To fully follow the guide, you will need to already have the data. The [`NeoDash_fish_preset.json`](https://github.com/agiga-quanta/PSSI_database/blob/main/NeoDash/NeoDash_fish_preset.json) dashboard preset can be access [here](https://github.com/agiga-quanta/PSSI_database/blob/main/NeoDash/NeoDash_fish_preset.json). In case you need a refresh on how to install NeoDash, click [here to be taken to a guide to install NeoDash](https://github.com/agiga-quanta/Neo4j-data-exploration-guide#part-2-setting-up-dataset-in-neo4j)

This guide is also included in a youtube playlist showing how to download and install `neo4j` Desktop [here](https://youtube.com/playlist?list=PL3KBtMOTv6gM73L33Ie1kHHKp6SXbEpyH)

## Part 1: Importing data into `neo4j`
Since our dataset are already made above in tsv files, you can import them into the project by following the steps below:
- Select the `...` option  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221722925-6c8227f6-95db-40d6-8430-186aea79b22c.png">

- Follow the path to `Open folder` -> `Imports`  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221722969-2313de06-4b8d-48ec-9d0b-d395ae5aac39.png">

You will be greeted with this window, where you can copy your data files here to use in `neo4j desktop`. Once done, you can close the window.  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221723006-10f64ff7-b05c-479a-bc22-1ddbc194d588.png">

## Part 2: Launching dashboard with NeoDash
To begin with, you will have to start a project in neo4j. 
The first time using this app, a warning message will pop up, asking for permission to access the graph data:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219418257-95620132-52ad-42e3-b857-7106e0ec2539.png">

You can click `Yes - Install`. The data it can access are only those limited to the project. When opening, `NeoDash` will ask if you want to create a new dashboard, or load an existing dashboard, or connect to neo4j desktop. `NeoDash` itself is just a tool to use `neo4j`, hence you will have to connect to a `neo4j` desktop project, we can select `Connect to Neo4j Desktop`.   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219420528-f66a9b1e-493e-4f26-9e04-ca1e3e9e4433.png">  

Once inside, you will be greeted with the following screen:  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219765488-b10fa080-3fd3-4e9a-9555-350ac3e65f45.png"> 

### 2.1 Loading a dashboard from `NeoDash_fish_preset.json` file
If you already have a dashboard file - in this case is `NeoDash_fish_preset.json`, you can access it [here](https://github.com/agiga-quanta/PSSI_database/blob/main/NeoDash/NeoDash_fish_preset.json). On the left column, you can load the dashboard by clicking the icon shown below:   
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/219776702-618eec2a-78c8-49e5-8674-2ce0e82f26bc.png">

To load from a json file copy the content from [`NeoDash_fish_preset.json`](https://github.com/agiga-quanta/PSSI_database/blob/main/NeoDash/NeoDash_fish_preset.json):  
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221725874-1133f621-7bc2-43f8-b32d-a51b689b032d.png"> 

Then paste the entire text within the file into the area below. Click `LOAD DASHBOARD` to load the preset.
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221699854-239aa186-c9d8-46aa-8627-2b808eb8d99c.png"> 

## Part 3: Using the preset "Lineage Tracking" dashboard

### Note for this particular dashboard: 
As of right now after loading, the dashboard disables all editing. **You can still use the dashboard while the editing is off**. This is for protecting the dashboard against unintended editing of the dashboard queries. In order to enable editing, follow the instruction below:  
1. Select the setting on the left.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Select%20settings.jpg?raw=true"> 

2. You will see that `Editable` is currently `off`. To switch it to on, simply click on it.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Currently%20off.jpg?raw=true"> 

3. Select `on` from the drop down menu, and then close the settings. The new settings will be saved automatically.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Select%20On%20for%20edit.jpg?raw=true"> 

As of right now, the dashboard has its own color code based on the label of data asset. Should you want to change it, follow the guide below:  

1. Select the extention setting on the left.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Select%20extention%20here%20.jpg?raw=true"> 

2. You will see the available extensions. For the color editing, select `Rule-Based Styling` to `Active`. Once you close both windows, you will be ready to change the color  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Enable%20Rule-based%20styling.jpg?raw=true"> 

3. From any report, select the setting on the top right side:  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Select%20report%20settings.jpg?raw=true"> 

4. Then, open the extention settings here:  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Select%20extension.jpg?raw=true"> 

5. Now, you will be shown the `Rule-Based Styling`, which allows you to set the many rules in your own ways. However, we are only here to change the `Node Color`.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Allow%20selecting%20color%20based%20on%20personalized%20rule.jpg?raw=true"> 

6. To change the color, select the hex number on the right. A color map will pop up, allowing you to manually select the color, or type in the hex box below.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Use%20Hex%20code%20for%20color.jpg?raw=true"> 

7. You can also google the code online and copy and paste it into the box.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Where%20to%20get%20hex%20code%20for%20color.jpg?raw=true"> 

### 3.1 Main Page  
Within the dashboard, you will be greeted with the `Main Page`. Here, you are instructed to import the data from the file given. You can click on the `play` button to import data. The output show will be `-1`, and this is normal.  You can now navigate to other pages to explore.
<img width="640" alt="image" src="https://user-images.githubusercontent.com/60938608/221699191-ce849dd4-5914-447f-bfb1-30c591d17899.png"> 

The `Hi there` report has also been extended with a short guide to show what each page does. Scroll down within the report to see what they are. The name of each pages is shown here, and their purpose is written below.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Note%20for%20Table%20of%20content.jpg?raw=true"> 

### 3.2 Finding the shortest path between two nodes
This page lets you chooose two nodes to find the shortest path between them.  
<img width="640" alt="image" src="https://github.com/agiga-quanta/PSSI_database/blob/main/images/Shortest%20path%20single.png?raw=true">

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

