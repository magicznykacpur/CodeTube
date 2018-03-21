CREATE OR REPLACE FUNCTION add_sub()
  RETURNS trigger AS
$BODY$
BEGIN
    UPDATE codetube.channel SET subscribers_count = (SELECT subscribers_count FROM codetube.channel WHERE id=new.subscribed_id) + 1
  WHERE id = new.subscribed_id;
           RETURN new;
END;
$BODY$
language plpgsql;

CREATE TRIGGER add_subscribe AFTER INSERT ON codetube.subscriber
FOR EACH ROW
EXECUTE PROCEDURE add_sub();
