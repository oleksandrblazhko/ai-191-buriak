CREATE OR REPLACE FUNCTION change_data(name VARCHAR, bd DATE)
RETURNS INTEGER
AS $$
DECLARE
str VARCHAR;
BEGIN
	str := 'UPDATE public.human SET bd = $1 where name = $2';
	RAISE
NOTICE 'Query=%', str;
EXECUTE str USING bd, name;
RETURN bd;
END;
$$
LANGUAGE plpgsql;
