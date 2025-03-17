```
docker exec -it <container id> bash

mysql -u root -p

describe hs_events;

SELECT table_name AS "Table",
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema = "wandb_local"
AND table_name = "hs_events";

DELETE FROM hs_events WHERE timestamp < UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 60 DAY));

OPTIMIZE TABLE hs_events;

```
