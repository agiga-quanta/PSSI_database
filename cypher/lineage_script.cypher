MATCH (n) DETACH DELETE n;
// DROP CONSTRAINT dataasset_uid;
// DROP INDEX dataasset_acronym;

// Create unique constraint
// CREATE CONSTRAINT dataasset_uid IF NOT EXISTS FOR (n: `DataAsset`) REQUIRE n.`p12_uid` IS UNIQUE;
// CREATE INDEX dataasset_acronym IF NOT EXISTS FOR (n: `DataAsset`) ON n.`p1_acronym`;

// Copy lineage.tsv into import/ folder (use Neo4j Desktop -> Project -> Reveal files in Folder)

//Load fishy lineage data
LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
        SET
            n.p02_name = TRIM(row.Data_Asset_Name),
            n.p10_gid = TRIM(row.Graph_ID),
            n.p11_iid = TRIM(row.Inventory_ID),
            n.p13_type = TRIM(row.Data_Asset_Type),
            n.p01_acronym = TRIM(row.Data_Asset_Acronym),
            n.p03_desc = TRIM(row.Data_Asset_Description),
            n.p04_format = TRIM(row.Data_Asset_Format),
            n.p05_decision = TRIM(row.Decision),
            n.p07_inbound = TRIM(row.Inbound_Data_Linkage),
            n.p08_outbound = TRIM(row.Outbound_Data_Linkage),
            n.p09_twoway = TRIM(row.Two_Way_Linkage),
            n.p14_dataset = TRIM(row.Send_To_Dataset),
            n.p15_product = TRIM(row.Send_To_Data_Product),
            n.p16_decision = TRIM(row.Informs_Decision),
            n.p17_label = TRIM(row.Data_Label),
            n.p06_topic = TRIM(row.Data_Asset_topic);
            
LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Inbound_Data_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)<-[r:IN]-(m)
        SET 
            r.type = TRIM(link[1])

UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Outbound_Data_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)-[r:OUT]->(m)
        SET 
            r.type = TRIM(link[1])

UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Two_Way_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)<-[r:TWO_WAYS]->(m)
        SET 
            r.type = TRIM(link[1])
          
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Send_To_Dataset, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)-[r:TO_DATASET]->(m)
        SET 
            r.type = TRIM(link[1])
            
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Send_To_Data_Product, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)-[r:TO_PRODUCT]->(m)
        SET 
            r.type = TRIM(link[1])
            
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {p12_uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Informs_Decision, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {p12_uid: TRIM(link[0])})
    MERGE (n)-[r:INFORMS]->(m)
        SET 
            r.type = TRIM(link[1]);
            
// Single shortest path  between two selected nodes
MATCH (n:DataAsset {p12_uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset {p12_uid: "PADS"})
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p

// All paths between two selected nodes
MATCH (n:DataAsset {p12_uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset {p12_uid: "PADS"})
WITH n, m    
    MATCH p=((m)-[*]->(n))
RETURN p

// All shortest path to connected nodes from a selected one ("directed connected component")
MATCH (n:DataAsset {p12_uid:"SOG"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p

// All distinct nodes, "directed-"connected to a selected node.
MATCH (n:DataAsset {p12_uid:"SOG"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN
	COUNT(DISTINCT(NODES(p)[0])) AS total,
	COLLECT(DISTINCT(NODES(p)[0].p01_acronym)) AS nodes;

// All shortest path, with length at least 3, to connected nodes from a selected one
MATCH (n:DataAsset {p12_uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) >=3
RETURN p

// All nodes can be reached from a selected one, with in three steps
MATCH (n:DataAsset {p12_uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) >=3
RETURN m

//Dynamic setting labels
MATCH (n:DataAsset)
WITH n
    UNWIND SPLIT(n.p17_label, '|') AS label
WITH n, label
    CALL apoc.create.addLabels(n, [label]) 
YIELD node
RETURN node

// Direct neighboring outbound
MATCH (n:DataAsset {p01_acronym: 'FOS'})
CALL apoc.path.spanningTree(n, {
        relationshipFilter: ">",
    maxLevel: 1
})
YIELD path
RETURN path

// Direct neighboring inbound
MATCH (n:DataAsset {p01_acronym: 'FOS'})
CALL apoc.path.spanningTree(n, {
        relationshipFilter: "<",
    maxLevel: 1
})
YIELD path
RETURN path

// Finding leaf nodes from a node
MATCH (n:DataAsset {p01_acronym: 'PAC_ADMIN'}), (m:DataAsset)
WHERE (n)-[*]->(m) AND NOT((m)-->())
RETURN DISTINCT m

// Finding roots node
MATCH (n:DataAsset {p01_acronym: 'FOS'}), (m:DataAsset)
WHERE (n)<-[*]-(m) AND NOT((m)<--())
RETURN DISTINCT m
