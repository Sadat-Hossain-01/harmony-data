CREATE TABLE "Group" (
    group_id       SERIAL
        CONSTRAINT group_pk
            PRIMARY KEY,
    group_name     VARCHAR(30) NOT NULL,
    intro          TEXT DEFAULT 'Welcome'::TEXT,
    created        DATE DEFAULT CURRENT_DATE,
    group_photo_id INTEGER
        CONSTRAINT group_content_content_id_fk
            REFERENCES "Content"
            ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE UNIQUE INDEX group_group_id_uindex
    ON "Group" (group_id);

