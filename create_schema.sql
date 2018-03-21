CREATE SCHEMA IF NOT EXISTS codetube;

-- DROP TABLE IF EXISTS codetube.channel;
CREATE TABLE IF NOT EXISTS codetube.channel (
  id                SERIAL PRIMARY KEY,
  creation_date     TIMESTAMP WITH TIME ZONE NOT NULL,
  settings          INTEGER                  NOT NULL,
  subscribers_count INTEGER
);

-- DROP TABLE IF EXISTS codetube.country;
CREATE TABLE IF NOT EXISTS codetube.country(
  id           SERIAL PRIMARY KEY,
  country_name TEXT   UNIQUE NOT NULL
);

-- DROP TABLE IF EXISTS codetube.restriction;
CREATE TABLE IF NOT EXISTS codetube.restriction(
  id SERIAL PRIMARY KEY,
  region_1 TEXT NOT NULL UNIQUE,
  region_2 TEXT NOT NULL UNIQUE,
  region_3 TEXT NOT NULL UNIQUE
);

-- DROP TABLE IF EXISTS codetube.settings;
CREATE TABLE IF NOT EXISTS codetube.settings(
  id              SERIAL PRIMARY KEY,
  black_theme       BOOLEAN NOT NULL,
  codetube_red      BOOLEAN NOT NULL,
  partnership       BOOLEAN NOT NULL,
  streaming         BOOLEAN NOT NULL,
  longer_than_15    BOOLEAN NOT NULL,
  video_privacy     BOOLEAN NOT NULL,
  custom_thumbnails BOOLEAN NOT NULL,
  aux_annotations   BOOLEAN NOT NULL
);

-- DROP TABLE IF EXISTS codetube.user_data;
CREATE TABLE IF NOT EXISTS codetube.user_data(
  id         SERIAL  PRIMARY KEY,
  country_id INTEGER REFERENCES country(id) NOT NULL,
  user_name  TEXT    UNIQUE                 NOT NULL,
  channel_id INTEGER REFERENCES channel(id) NOT NULL
);

-- DROP TABLE IF EXISTS codetube.login_info;
CREATE TABLE IF NOT EXISTS codetube.login_info (
id            SERIAL PRIMARY KEY,
user_data_id  INTEGER REFERENCES user_data(id)  UNIQUE,
email         TEXT                              NOT NULL,
password_hash TEXT                              NOT NULL,
salt          TEXT                              NOT NULL
);



-- DROP TABLE IF EXISTS codetube.subscriber;
CREATE TABLE IF NOT EXISTS codetube.subscriber(
id            SERIAL  PRIMARY KEY,
subscriber_id INTEGER REFERENCES channel(id) NOT NULL,
subscribed_id INTEGER REFERENCES channel(id) NOT NULL
);

-- DROP TABLE IF EXISTS codetube.stream;
CREATE TABLE IF NOT EXISTS codetube.stream(
id SERIAL PRIMARY KEY,
channel_id INTEGER REFERENCES channel(id) NOT NULL,
title TEXT NOT NULL,
description TEXT,
lajks_count INTEGER,
dislajks_count INTEGER,
viewers_count INTEGER
);


-- DROP TABLE IF EXISTS codetube.stream_channel;
CREATE TABLE IF NOT EXISTS codetube.stream_channel(
id          SERIAL  PRIMARY KEY,
stream_id   INTEGER REFERENCES stream(id)  NOT NULL,
channel_id  INTEGER REFERENCES channel(id) NOT NULL,
action      BOOLEAN,
is_watching BOOLEAN
);

-- DROP TABLE IF EXISTS codetube.video;
CREATE TABLE IF NOT EXISTS codetube.video(
  id               SERIAL  PRIMARY KEY,
  channel_id       INTEGER REFERENCES channel(id)     NOT NULL,
  title            TEXT                               NOT NULL,
  length           INTEGER                            NOT NULL,
  views_count      INTEGER,
  lajks_count      INTEGER,
  dislajks_count   INTEGER,
  url              TEXT    UNIQUE                     NOT NULL,
  description      TEXT,
  privacy_settings BOOLEAN                            NOT NULL,
  restrictions     INTEGER REFERENCES restriction(id) NOT NULL
);

-- DROP TABLE IF EXISTS codetube.view;
CREATE TABLE IF NOT EXISTS codetube.view(
id         SERIAL  PRIMARY KEY,
channel_id INTEGER REFERENCES channel(id) NOT NULL,
video_id   INTEGER REFERENCES video(id)   NOT NULL,
lajk       BOOLEAN,
dislajk    BOOLEAN
);



-- DROP TABLE IF EXISTS codetube.playlist;
CREATE TABLE IF NOT EXISTS codetube.playlist(
  id          SERIAL PRIMARY KEY,
  channel_id  INTEGER REFERENCES channel(id) NOT NULL,
  title       TEXT                           NOT NULL,
  video_count INTEGER
);

-- DROP TABLE IF EXISTS codetube.playlist_video;
CREATE TABLE IF NOT EXISTS codetube.playlist_video(
  id          SERIAL  PRIMARY KEY,
  playlist_id INTEGER REFERENCES playlist(id) NOT NULL,
  video_id    INTEGER REFERENCES video(id)    NOT NULL
);