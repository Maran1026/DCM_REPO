DEFINE SCHEMA {{db}}.RAW
    COMMENT = 'Landing zone for ingested data - {{env}}'
    DATA_RETENTION_TIME_IN_DAYS = {{retention_days}};

DEFINE SCHEMA {{db}}.ANALYTICS
    WITH MANAGED ACCESS
    COMMENT = 'Transformation layer - {{env}}'
    DATA_RETENTION_TIME_IN_DAYS = {{retention_days}};

DEFINE SCHEMA {{db}}.SERVE
    WITH MANAGED ACCESS
    COMMENT = 'Consumption layer for BI and reporting - {{env}}'
    DATA_RETENTION_TIME_IN_DAYS = {{retention_days}};

DEFINE WAREHOUSE GITOPS_WH{{env_suffix}}
WITH
    WAREHOUSE_SIZE = '{{wh_size}}'
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse for GitOps project - {{env}}';
