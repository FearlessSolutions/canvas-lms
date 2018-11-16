cat >/import.cql <<EOF
CREATE keyspace IF NOT EXISTS page_views with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace IF NOT EXISTS page_views_test with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace IF NOT EXISTS auditors with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace IF NOT EXISTS auditors_test with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
EOF

cqlsh -f /import.cql; 


