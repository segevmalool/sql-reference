-- Generates multiple columns to put in a table
insert into account (
  id, 
  prior_balance, 
  owner
) select * from unnest((
  select array_agg((
    uuid_generate_v4(), -- Col 1
    random(),           -- Col 2 
    md5(random()::text) -- Col 3
  )) 
  from generate_series(0,10) -- Number of rows
)) as (id UUID, prior_balance double precision, owner character varying); -- Type cast (column definition list)
