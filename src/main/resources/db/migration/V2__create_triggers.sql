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

CREATE OR REPLACE FUNCTION add_view()
  RETURNS trigger AS
$BODY$
BEGIN
    UPDATE codetube.video SET views_count = (SELECT views_count FROM codetube.video WHERE id=new.video_id) + 1
    WHERE id = new.video_id;
           RETURN new;
END;
$BODY$
language plpgsql;

CREATE TRIGGER add_view AFTER INSERT ON codetube.view
FOR EACH ROW
EXECUTE PROCEDURE add_view();

CREATE OR REPLACE FUNCTION add_like()
  RETURNS trigger AS
$BODY$
BEGIN
    UPDATE codetube.video SET lajks_count = (SELECT lajks_count FROM codetube.video WHERE id=new.video_id) + 1
    WHERE id = new.video_id;
           RETURN new;
END;
$BODY$
language plpgsql;

CREATE TRIGGER add_like AFTER INSERT ON codetube.view
FOR EACH ROW
EXECUTE PROCEDURE add_like();

CREATE OR REPLACE FUNCTION add_dislike()
  RETURNS trigger AS
$BODY$
BEGIN
    UPDATE codetube.video SET dislajks_count = (SELECT dislajks_count FROM codetube.video WHERE id=new.video_id) + 1
    WHERE id = new.video_id;
           RETURN new;
END;
$BODY$
language plpgsql;

CREATE TRIGGER add_dislike AFTER INSERT ON codetube.view
FOR EACH ROW
EXECUTE PROCEDURE add_dislike();
