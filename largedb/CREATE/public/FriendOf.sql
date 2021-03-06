CREATE TABLE "FriendOf" (
    user_1 INTEGER NOT NULL
        CONSTRAINT friendof_user_user_id_fk
            REFERENCES "User"
            ON UPDATE CASCADE ON DELETE CASCADE,
    user_2 INTEGER NOT NULL
        CONSTRAINT friendof_user_user_id_fk_2
            REFERENCES "User"
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT friendof_pk
        PRIMARY KEY (user_1, user_2),
    CONSTRAINT friendof_pk_2
        UNIQUE (user_1, user_2)
);

COMMENT ON TABLE "FriendOf" IS 'a recursive relation of user entity set';

ALTER TABLE "FriendOf"
    OWNER TO postgres;

