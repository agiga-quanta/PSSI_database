MATCH (n) DETACH DELETE n;
DROP CONSTRAINT database_uid;
DROP INDEX database_acronym;
// Create unique constraint
CREATE CONSTRAINT database_uid IF NOT EXISTS FOR (n: `Database`) REQUIRE n.`uid` IS UNIQUE;

CREATE INDEX database_acronym IF NOT EXISTS FOR (n: `Database`) ON (n.`acronym`);

// Copy lineage.tsv into import/ folder (use Neo4j Desktop -> Project -> Reveal files in Folder)

//Load fishy lineage data
LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Data_Asset_Acronym)})
        SET
            n.name = TRIM(row.Data_Asset_Name),
            n.gid = TRIM(row.Graph_ID),
            n.iid = TRIM(row.Inventory_ID),
            n.type = TRIM(row.Data_Asset_Type),
            n.acronym = TRIM(row.Data_Asset_Acronym),
            n.desc = TRIM(row.Data_Asset_Description),
            n.format = TRIM(row.Data_Asset_Format),
            n.decision = TRIM(row.Decision),
            n.inbound = TRIM(row.Inbound_Data_Linkage),
            n.outbound = TRIM(row.Outbound_Data_Linkage),
            n.twoway = TRIM(row.Two_Way_Linkage),
            n.topic = TRIM(row.Data_Asset_topic);
            
LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Inbound_Data_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)<-[r:IN]-(m)
        SET 
            r.type = TRIM(link[1])

UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Outbound_Data_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)-[r:OUT]->(m)
        SET 
            r.type = TRIM(link[1])

UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Data_Asset_Acronym)})
WITH row, n
    UNWIND SPLIT(row.Two_Way_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)<-[r:TWO_WAYS]->(m)
        SET 
            r.type = TRIM(link[1]);
            
// Single shortest path  between two selected nodes
MATCH (n:DataAsset {uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset {uid: "PADS"})
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p

// All paths between two selected nodes
MATCH (n:DataAsset {uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset {uid: "PADS"})
WITH n, m    
    MATCH p=((m)-[*]->(n))
RETURN p

// All shortest path to connected nodes from a selected one ("directed connected component")
MATCH (n:DataAsset {uid:"SOG"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p

// All distinct nodes, "directed-"connected to a selected node.
MATCH (n:DataAsset {uid:"SOG"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN
	COUNT(DISTINCT(NODES(p)[0])) AS total,
	COLLECT(DISTINCT(NODES(p)[0].acronym)) AS nodes;

// All shortest path, with length at least 3, to connected nodes from a selected one
MATCH (n:DataAsset {uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) >=3
RETURN p

// All nodes can be reached from a selected one, with in three steps
MATCH (n:DataAsset {uid:"MRP_SYS"})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) >=3
RETURN m

// Top 5 data sender
MATCH (n:DataAsset), (m:DataAsset)
MATCH (m)-[r:OUT]->(n)
RETURN n.acronym as name, COUNT(m) as no_out ORDER BY no_out DESC LIMIT 5