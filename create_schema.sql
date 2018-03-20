CREATE SCHEMA IF NOT EXISTS codetube;

DROP TABLE IF EXISTS codetube.channel;
CREATE TABLE codetube.channel();

DROP TABLE IF EXISTS codetube.login_info;
CREATE TABLE codetube.login_info();

DROP TABLE IF EXISTS codetube.user_data;
CREATE TABLE codetube.user_data();

DROP TABLE IF EXISTS codetube.country;
CREATE TABLE codetube.country();

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