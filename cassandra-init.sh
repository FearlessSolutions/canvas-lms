cat >/import.cql <<EOF
DROP keyspace page_views;
DROP keyspace page_views_test;
DROP keyspace auditors;
DROP keyspace auditors_test;
CREATE keyspace page_views with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace page_views_test with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace auditors with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
CREATE keyspace auditors_test with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
EOF

# You may add some other conditionals that fits your stuation here
until cqlsh -f /import.cql; do
  echo "cqlsh: Cassandra is unavailable to initialize - will retry later"
  sleep 2
done &

exec /docker-entrypoint.sh "$@"
