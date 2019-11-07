DROP DATABASE evaluation_bdd;
CREATE DATABASE evaluation_bdd;
USE evaluation_bdd;


CREATE TABLE clients (
  cli_num int(11) NOT NULL,
  cli_nom varchar(50) DEFAULT NULL,
  cli_adresse varchar(50) DEFAULT NULL,
  cli_tel varchar(30) DEFAULT NULL,
  PRIMARY KEY (cli_num),
  KEY nom (cli_nom)
);

CREATE TABLE commande (
  com_num int(11) NOT NULL,
  cli_num int(11) DEFAULT NULL,
  com_date datetime DEFAULT NULL,
  com_obs varchar(50) DEFAULT NULL,
  PRIMARY KEY (com_num),
   FOREIGN KEY fk_1 (cli_num) REFERENCES clients (cli_num)
);

CREATE TABLE produit (
  pro_num int(11) NOT NULL,
  pro_libelle varchar(50) DEFAULT NULL,
  pro_description varchar(50) DEFAULT NULL,
  PRIMARY KEY fk_4 (pro_num)
); 

CREATE TABLE est_compose (
  com_num int(11) NOT NULL,
  pro_num int(11) NOT NULL,
  est_qte int(11) DEFAULT NULL,
  PRIMARY KEY (com_num,pro_num),
  FOREIGN KEY fk_2 (com_num) REFERENCES commande(com_num),
  FOREIGN KEY fk_3 (pro_num) REFERENCES produit(pro_num)
);

DROP INDEX IF EXISTS nom ON clients;
ALTER TABLE clients;
CREATE INDEX clnom ON clients(cli_nom);