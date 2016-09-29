CREATE TABLE fluentd (
    tag text,
    ts timestamp with time zone,
    record jsonb
);

ALTER TABLE fluentd OWNER TO snaga;

REVOKE ALL ON TABLE fluentd FROM PUBLIC;
REVOKE ALL ON TABLE fluentd FROM snaga;
GRANT ALL ON TABLE fluentd TO snaga;
GRANT INSERT ON TABLE fluentd TO fluentd_agent;

