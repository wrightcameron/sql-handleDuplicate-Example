# Solution

## Finding Duplicates

An issue with duplicates will probably be first noticed when a table is much larger than it should be.  Doing a `SELECT` and comparing a table with its unique index should show the issue.

Running this `SELECT` will show many results with duplicate sensors

```sql
select *
from sensor
```

Duplicates shouldn't have happened, check that the index is set.  Postgres doesn't have `DESCRIBE` so the \d keyword is being used with psql

```sql
\d sensor
```

Looking at the unique index, it appears to be set but null values are not equal to each other so they are circumventing the constraint.

## Creating index or constraint

With the problem identified, a constraint or index could be created to prevent future duplicates.  Now Postgres won't allow this index/constraint cause there are null values already.  But showing this error will make the next steps on handing this make sense.

```sql
ALTER TABLE sensor ALTER COLUMN sen_manufactor SET NOT NULL;
```

Running this command, the error below is returned.

```text
ERROR:  column "sen_manufactor" of relation "sensor" contains null values
```

So the null value is going to have to be replaced with a manufacture, and duplicates will need to be deleted.  In this problem a manufacture will need to be figured out.  Before duplicates can be removed, the grouping of data has to be understood first.

## Grouping Duplicate Data Together

The `GROUP BY` clause in a SQL statement can be used to group the duplicates into groupings. A `GROUP BY` clause is used for aggregating data.

```sql
select sen_serial, sen_type, sen_manufactor
from sensor 
group by 1,2,3;
```

TODO: Add section that clarifies the distinct and distinct on.

When data is grouped to limit the return of groupings, the `DISTINCT` clause can be used.  `DISTINCT` has two different syntax's

* DISTINCT
* DISTINCT ON ()

```sql
SELECT DISTINCT sen_serial, sen_type, sen_manufactor
FROM sensor
GROUP BY 1,2,3;
```

```sql
SELECT DISTINCT ON (sen_type, sen_manufactor) sen_serial
FROM sensor;
```

The `ORDER BY` clause can be added to the query to put the duplicate we would like to keep at the top

```sql
select distinct on(sen_serial, sen_manufactor) sen_id
select sen_serial, sen_type, sen_manufactor
from sensor 
order by sen_add_on desc;
```

## Deleting duplicates

Deleting duplicate's can be done using the group by above and adding it as a sub query `DELETE FROM`

```sql
delete from sensor 
where sen_id not in (
    select distinct on (sen_serial, sen_manufactor) sen_id 
    from sensor 
    order by sen_serial, sen_manufactor);
```

Some of the rows that were grouped have the same serial as rows that contain a manufacture.  We will delete these three with another query.

```sql
delete from sensor
where sen_id in (
    select sen_id
    from sensor
    where sen_manufactor is null
);
```

## Updating constraint

The sensor table can now be altered so sen_manufactor can't be null.

```sql
ALTER TABLE sensor ALTER COLUMN sen_manufactor SET NOT NULL;
```
