CREATE OR REPLACE FUNCTION get_data(name VARCHAR)
RETURNS TABLE
    (p_id INTEGER, p_name VARCHAR, p_bd DATE)
AS $$
DECLARE
str VARCHAR;
BEGIN
	str := 'SELECT p_id, name, bd from public.human where name = $1';
	RAISE NOTICE 'Query=%',str;
RETURN QUERY EXECUTE str USING name;
END;
$$
LANGUAGE plpgsql;
