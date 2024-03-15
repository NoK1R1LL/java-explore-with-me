drop table if exists categories cascade;
drop table if exists users cascade;
drop table if exists events cascade;
drop table if exists requests cascade;
drop table if exists compilations cascade;
drop table if exists compilations_events cascade;

create table if not exists categories
(
    cat_id   bigint generated by default as identity not null,
    cat_name varchar(200)                            not null,
    constraint pk_cat primary key (cat_id),
    constraint uq_name_cat unique (cat_name)
);

create table if not exists users
(
    user_id  bigint generated by default as identity not null,
    email    varchar(512)                            not null,
    username varchar(512)                            not null,
    constraint pk_u primary key (user_id),
    constraint uq_email unique (email)
);

create table if not exists events
(
    event_id           bigint generated by default as identity not null,
    annotation         varchar(2000)                           not null,
    cat_id             bigint                                  not null,
    created_on         timestamp without time zone             not null,
    description        varchar(7000)                           not null,
    event_date         timestamp without time zone             not null,
    initiator_id       bigint                                  not null references users (user_id),
    lat                float                                   not null,
    lon                float                                   not null,
    paid               boolean                                 not null,
    participant_limit  integer                                 not null,
    published_on       timestamp without time zone,
    request_moderation boolean                                 not null,
    state              varchar(64)                             not null,
    title              varchar(2048)                           not null,
    constraint pk_events primary key (event_id),
    constraint fk_events_cat foreign key (cat_id) references categories (cat_id)
);

create table if not exists requests
(
    req_id      bigint generated by default as identity not null,
    req_created timestamp without time zone             not null,
    event_id    bigint                                  not null,
    user_id     bigint                                  not null,
    status      VARCHAR(64)                             not null,
    constraint pk_req primary key (req_id),
    constraint fk_req_event foreign key (event_id) references events (event_id),
    constraint fk_req_user foreign key (user_id) references users (user_id)
);

create table if not exists compilations
(
    compilation_id bigint generated by default as identity not null,
    pinned         boolean                                 not null,
    title          varchar(2048),
    constraint pk_compilations primary key (compilation_id)
);

create table if not exists compilations_events
(
    comp_event_id  bigint generated by default as identity not null,
    compilation_id bigint                                  not null,
    event_id       bigint                                  not null,
    constraint pk_comp_event primary key (comp_event_id),
    constraint fk_comp foreign key (compilation_id) references compilations (compilation_id),
    constraint fk_event foreign key (event_id) references events (event_id)
);
