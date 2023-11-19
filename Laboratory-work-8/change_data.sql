CREATE OR REPLACE FUNCTION change_data(name VARCHAR, bd DATE)
RETURNS INTEGER
AS $$
DECLARE
str VARCHAR;
BEGIN
	str := 'UPDATE public.human SET bd = ''' || bd ||
    ''' where name = ''' || name || '''';
	RAISE
NOTICE 'Query=%', str;
EXECUTE str;
RETURN bd;
END;
$$
LANGUAGE plpgsql;
