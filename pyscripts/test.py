import sqlalchemy as sa
from sqlalchemy.sql import text

kylin_engine = sa.create_engine('kylin://ADMIN:KYLIN@localhost:7071/learn_kylin?timeout=60&is_debug=1')

# Establish a connection
with kylin_engine.connect() as connection:
    # Execute the query
    results = connection.execute(text('SELECT * FROM sample_ssb LIMIT 1'))
    # Fetch and print the first result
    print(results.fetchone())
