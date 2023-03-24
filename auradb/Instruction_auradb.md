# A guide to import the PSSI database to AuraDB, and visualize with [`NeoDash`](https://neo4j.com/developer-blog/neodash-2-0-a-brand-new-way-to-visualize-neo4j/)

This is a guide to deploying the PSSI database to AuraDB, and visualizing with NeoDash. The pros of this methods allows others to access the database without it being on a local computer or server. The cons is that the free version of AuraDB will only allow one database instance at a time, and also limited in terms of number of nodes and relationships, as well as database size. This guide is for showing the workings and serving as an instruction to how to use AuraDB. Afterwhich, the user can choose to upgrade at their own leisure. 

## Part 1: Creating an AuraDB instance
To create an AuraDB instance, go to the following link: `https://neo4j.com/cloud/platform/aura-graph-database/`
Once in, you click on `START FREE`, shown below: 
(Signup on Aura)

Now that you are inside, you are prompted to sign into your neo4j aura account. however, if you do not have one, feel free to sign up. 
(Sign up page)

Once you logged in, you can create a `New Instance` by clicking on the blue button shown below. For the free tier, you can have one instance for free. The instance can be access from anywhere, as long as you have the link, username and password.   
(Create an instance)

You will also be prompted to save an auto-generated password, or download the `.env` file which will save both the auradb information and your credentials.  
(Download the credentials)  

Your username and password will also be shown below
()

When being prompted to choose the dataset for the instance, select the `Empty Instance`:  
(Create empty instance)

Now, `neo4j aura` will take some minutes to create the instance. For this project, it took roughly five minutes.  
(Creating instance)

Once it is running, you can see it like the image below. Note that the instance now have a green dot, showing the status as `Running`. At the bottom, you will see other details about the instances, such as `Neo4j version`, `Nodes`, `Relationships`, `Connection URL`. As of now, the `Connection URL` is our main interest. 
(Details on instance as well as connection)

If you want to, you can access the auraDB directly by clicking `Open` button. Going in, you will need to use your username and password stored when downloading the `.env` file.

## Part 2: Connecting to AuraDB with NeoDash
When connecting to AuraDB, use the following link: `https://neodash.graphapp.io`. When connected, select `New Dashboard`. You will be prompted with the `Protocol` and `Hostname`, as well as the `Username` and `Password`. For each of them, use the following:  
- `Protocol`: `neo4j-s`  
- `Hostname`: the following part from the `Connection URL` shown above, or directly below  
- `Username`: `NEO4J_USERNAME` from the `.env` file  
- `Password`: `NEO4J_PASSWORD` from the `.env` file  
()

Once you are inside, you can now load the dashboard link here to use it with the new database. 

## Part 3: Exporting to `.graphml` file
Before we do this, the exporting from neo4j uses apoc, so we need to create a configuration file for apoc on our computer. Open up any document writing tools (in this case, the program used is Visual Studio Code), create a file called `apoc.conf`, where you will write these 2 lines, or just copy them.
```

```

In order to export to `.graphml` file, you can access into any neo4j browser that is connected to the database, either on neo4j server, or on neo4j desktop, and run the following code line. In this case, the exported graphml file is named `fish.graphml`
```cypher
CALL apoc.export.graphml.all('fish.grapmhl', {})
```
(Export complete)

Afterward, the file can be found in the `import` folder.  
(Show import folder)