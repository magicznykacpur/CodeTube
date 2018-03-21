CREATE SCHEMA IF NOT EXISTS codetube;

DROP TABLE IF EXISTS codetube.channel;
CREATE TABLE codetube.channel (
  id                SERIAL PRIMARY KEY,
  creation_date     TIMESTAMP WITH TIME ZONE NOT NULL,
  settings          INTEGER                  NOT NULL,
  subscribers_count INTEGER
);

DROP TABLE IF EXISTS codetube.login_info;
CREATE TABLE codetube.login_info (
  id            SERIAL PRIMARY KEY,
  user_data_id  INTEGER REFERENCES user_data(id)  UNIQUE,
  email         TEXT                              NOT NULL,
  password_hash TEXT                              NOT NULL,
  salt          TEXT                              NOT NULL
);

DROP TABLE IF EXISTS codetube.user_data;
CREATE TABLE codetube.user_data(
  id         SERIAL  PRIMARY KEY,
  country_id INTEGER REFERENCES country(id) NOT NULL,
  user_name  TEXT    UNIQUE                 NOT NULL,
  channel_id INTEGER REFERENCES channel(id) NOT NULL
);

DROP TABLE IF EXISTS codetube.country;
CREATE TABLE codetube.country(
  id           SERIAL PRIMARY KEY,
  country_name TEXT   UNIQUE NOT NULL
);

DROP TABLE IF EXISTS codetube.subscriber;
CREATE TABLE codetube.subscriber(
  id            SERIAL  PRIMARY KEY,
  subscriber_id INTEGER REFERENCES channel(id) NOT NULL,
  subscribed_id INTEGER REFERENCES channel(id) NOT NULL
);

DROP TABLE IF EXISTS codetube.stream;
CREATE TABLE codetube.stream(
  id SERIAL PRIMARY KEY,
  channel_id INTEGER REFERENCES channel(id) NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  lajks_count INTEGER,
  dislajks_count INTEGER,
  viewers_count INTEGER
);

DROP TABLE IF EXISTS codetube.settings;
CREATE TABLE codetube.settings(
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

DROP TABLE IF EXISTS codetube.stream_channel;
CREATE TABLE codetube.stream_channel(
  id          SERIAL  PRIMARY KEY,
  stream_id   INTEGER REFERENCES stream(id)  NOT NULL,
  channel_id  INTEGER REFERENCES channel(id) NOT NULL,
  action      BOOLEAN,
  is_watching BOOLEAN
);

DROP TABLE IF EXISTS codetube.view;
CREATE TABLE codetube.view(
  id         SERIAL  PRIMARY KEY,
  channel_id INTEGER REFERENCES channel(id) NOT NULL,
  video_id   INTEGER REFERENCES video(id)   NOT NULL,
  lajk       BOOLEAN,
  dislajk    BOOLEAN
);

DROP TABLE IF EXISTS codetube.restriction;
CREATE TABLE codetube.restriction(
  id SERIAL PRIMARY KEY,
  region_1 TEXT NOT NULL UNIQUE,
  region_2 TEXT NOT NULL UNIQUE,
  region_3 TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS codetube.video;
CREATE TABLE codetube.video();

DROP TABLE IF EXISTS codetube.playlist;
CREATE TABLE codetube.playlist();

DROP TABLE IF EXISTS codetube.playlist_video;
CREATE TABLE codetube.playlist_video();