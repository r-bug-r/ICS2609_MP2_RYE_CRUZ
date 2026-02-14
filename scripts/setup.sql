CREATE TABLE USERS (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Admin Accounts (5)
INSERT INTO USERS VALUES ('admin_rye', 'pass123', 'admin');
INSERT INTO USERS VALUES ('admin_cruz', 'cruz456', 'admin');
INSERT INTO USERS VALUES ('admin_root', 'root000', 'admin');
INSERT INTO USERS VALUES ('admin_dev', 'dev789', 'admin');
INSERT INTO USERS VALUES ('admin_sec', 'sec111', 'admin');

-- Guest Accounts (15)
INSERT INTO USERS VALUES ('guest_01', 'guest01', 'guest');
INSERT INTO USERS VALUES ('guest_02', 'guest02', 'guest');
INSERT INTO USERS VALUES ('guest_03', 'guest03', 'guest');
INSERT INTO USERS VALUES ('guest_04', 'guest04', 'guest');
INSERT INTO USERS VALUES ('guest_05', 'guest05', 'guest');
INSERT INTO USERS VALUES ('guest_06', 'guest06', 'guest');
INSERT INTO USERS VALUES ('guest_07', 'guest07', 'guest');
INSERT INTO USERS VALUES ('guest_08', 'guest08', 'guest');
INSERT INTO USERS VALUES ('guest_09', 'guest09', 'guest');
INSERT INTO USERS VALUES ('guest_10', 'guest10', 'guest');
INSERT INTO USERS VALUES ('guest_11', 'guest11', 'guest');
INSERT INTO USERS VALUES ('guest_12', 'guest12', 'guest');
INSERT INTO USERS VALUES ('guest_13', 'guest13', 'guest');
INSERT INTO USERS VALUES ('guest_14', 'guest14', 'guest');
INSERT INTO USERS VALUES ('guest_15', 'guest15', 'guest');
