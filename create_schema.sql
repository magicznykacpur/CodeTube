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
  country_name TEXT   NOT NULL
);

DROP TABLE IF EXISTS codetube.subscriber;
CREATE TABLE codetube.subscriber();

DROP TABLE IF EXISTS codetube.stream;
CREATE TABLE codetube.stream();

DROP TABLE IF EXISTS codetube.settings;
CREATE TABLE codetube.settings();

DROP TABLE IF EXISTS codetube.stream_channel;
CREATE TABLE codetube.stream_channel();

DROP TABLE IF EXISTS codetube.view;
CREATE TABLE codetube.view();

DROP TABLE IF EXISTS codetube.restriction;
CREATE TABLE codetube.restriction();

DROP TABLE IF EXISTS codetube.video;
CREATE TABLE codetube.video();

DROP TABLE IF EXISTS codetube.playlist;
CREATE TABLE codetube.playlist();

DROP TABLE IF EXISTS codetube.playlist_video;
CREATE TABLE codetube.playlist_video();