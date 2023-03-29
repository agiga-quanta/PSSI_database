//Clear current database
MATCH(n) DETACH DELETE n;
//Load fishy lineage data
LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
        SET
            n.Asset_Name = TRIM(row.Asset_Name),
            n.Graph_ID = TRIM(row.Graph_ID),
            n.Type = TRIM(row.Type),
            n.Acronym = TRIM(row.Acronym),
            n.Description = TRIM(row.Description),
            n.Format = TRIM(row.Format),
            n.Informs_Decision = TRIM(row.Informs_Decision),
            n.Linkage_Inbound = TRIM(row.Linkage_Inbound),
            n.Linkage_Outbound = TRIM(row.Linkage_Outbound),
            n.Twoway = TRIM(row.Two_Way_Linkage),
            n.Sends_to_dataset = TRIM(row.Send_To_Dataset),
            n.Sends_to_data_product = TRIM(row.Send_To_Data_Product),
            n.Informs_decision = TRIM(row.Informs_Decision),
            n.Label = TRIM(row.Label),
            n.Topic = TRIM(row.Topic);

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
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
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
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
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
WITH row, n
    UNWIND SPLIT(row.Two_Way_Linkage_List, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)<-[r:TWO_WAYS]->(m)
        SET 
            r.type = TRIM(link[1])
          
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
WITH row, n
    UNWIND SPLIT(row.Send_To_Dataset, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)-[r:TO_DATASET]->(m)
        SET 
            r.type = TRIM(link[1])
            
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
WITH row, n
    UNWIND SPLIT(row.Send_To_Data_Product, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)-[r:TO_PRODUCT]->(m)
        SET 
            r.type = TRIM(link[1])
            
UNION 

LOAD CSV WITH HEADERS FROM 'file:///lineage.tsv' AS row FIELDTERMINATOR '\t'
WITH row
    WHERE row IS NOT NULL AND row.Acronym IS NOT NULL
WITH row
    MERGE (n:DataAsset {uid: TRIM(row.Acronym)})
WITH row, n
    UNWIND SPLIT(row.Informs_Decision, '|') AS links 
WITH row, n, SPLIT(links, ':') AS link
    MERGE (m:DataAsset {uid: TRIM(link[0])})
    MERGE (n)-[r:INFORMS]->(m)
        SET 
            r.type = TRIM(link[1]);
            
// Single shortest path  between two selected nodes
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_2 })
WITH n
    MATCH (m:DataAsset {uid: $neodash_dataasset_uid_1 })
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p


// All paths between two selected nodes
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_4 })
WITH n
    MATCH (m:DataAsset {uid: $neodash_dataasset_uid_3 })
WITH n, m    
    MATCH p=((m)-[*]->(n))
RETURN p

// All shortest path to connected nodes from a selected one ("directed connected component")
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_5})
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN p

// All distinct nodes, "directed-"connected to a selected node.
MATCH (n:DataAsset {uid:$neodash_dataasset_uid_6 })
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
RETURN
	COUNT(DISTINCT(NODES(p)[0])) AS total_connected,
	COLLECT(DISTINCT(NODES(p)[0].Acronym)) AS nodes;

// All shortest paths, with length exact, to connected nodes from selected one
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_7 })
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) = toInteger($neodash_exact_length_1)
RETURN p

// All shortest paths, with length exact, to connected nodes from selected one
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_7 })
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) = toInteger($neodash_exact_length_1)
RETURN p

// All nodes can be reached from a selected one, within maximum steps
MATCH (n:DataAsset {uid: $neodash_dataasset_uid_9  })
WITH n
    MATCH (m:DataAsset)
        WHERE m <> n
WITH n, m    
    MATCH p=SHORTESTPATH((m)-[*]->(n))
        WHERE LENGTH(p) <= toInteger($neodash_maximum_length_2)
RETURN m

//Dynamic setting labels
MATCH (n:DataAsset)
WITH n
    UNWIND SPLIT(n.Label, '|') AS label
WITH n, label
    CALL apoc.create.addLabels(n, [label]) 
YIELD node
RETURN node

// Direct neighboring outbound
MATCH (n:DataAsset {Acronym: $neodash_dataasset_uid_10 })
CALL apoc.path.spanningTree(n, {
        relationshipFilter: ">",
    maxLevel: 1
})
YIELD path
RETURN path

// Direct neighboring inbound
MATCH (n:DataAsset {Acronym: $neodash_dataasset_uid_10 })
CALL apoc.path.spanningTree(n, {
        relationshipFilter: "<",
    maxLevel: 1
})
YIELD path
RETURN path

// Finding leaf nodes from a node
MATCH (n:DataAsset {Acronym: 'PAC_ADMIN'}), (m:DataAsset)
WHERE (n)-[*]->(m) AND NOT((m)-->())
RETURN DISTINCT m

// Finding roots node
MATCH (n:DataAsset {Acronym: 'FOS'}), (m:DataAsset)
WHERE (n)<-[*]-(m) AND NOT((m)<--())
RETURN DISTINCT m

//Find neighbor of a selected node, else display all graph

WITH CASE $neodash_dataasset_acronym_12 IS NOT NULL WHEN TRUE THEN not(isEmpty($neodash_dataasset_acronym_12)) ELSE FALSE END AS condition
CALL apoc.do.when(condition, 
  'MATCH (n:DataAsset {Acronym: selected_acronym })
CALL apoc.path.spanningTree(n, {
  maxLevel: selected_distance
})
YIELD path
RETURN path


',
  'Match (n) OPTIONAL MATCH (n)-[path]-() RETURN n, path', 
  {selected_acronym: $neodash_dataasset_acronym_12, selected_distance: $neodash_distance})
YIELD value
RETURN value.path, value.n
