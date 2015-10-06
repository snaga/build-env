drop table dim_time;

create table dim_time as
with t as (
select
    now()::time + (generate_series(0,60*60*24)::text || ' sec')::interval as t
)
select
    distinct
    date_trunc('second', t)::time as time,
    extract(hour from t) as hour,
    extract(minute from t) as minute,
    extract(second from date_trunc('second', t)) as second
  from
    t
 order by
    time;

select
    count(*)
  from
    dim_time;

create index dim_time_time_idx on dim_time(time);

grant SELECT on dim_time TO audit102;

