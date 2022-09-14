--USE master
--CREATE DATABASE Apilicious;
--GO

--USE master
--DROP DATABASE Apilicious;
--GO

USE Apilicious;
GO

CREATE TABLE Utilisateur(
	uti_id		 INT PRIMARY KEY IDENTITY NOT NULL,
	uti_pseudo	 VARCHAR(12) NOT NULL,
	uti_nom		 VARCHAR(15) NOT NULL,
	uti_prenom   VARCHAR(15) NOT NULL,
	uti_DDN      DATE NOT NULL,
	uti_ville    VARCHAR(25) NOT NULL,
	uti_mail     VARCHAR(25) NOT NULL,
	uti_mdp		 VARCHAR(25) NOT NULL,
	uti_avatar	 VARCHAR(1000) NULL,
);

ALTER TABLE Utilisateur
ALTER COLUMN uti_mail VARCHAR(100) NOT NULL;

CREATE TABLE Media(
	med_id			INT PRIMARY KEY IDENTITY NOT NULL,
	med_chemin		VARCHAR(1000) NOT NULL,
	med_type		VARCHAR(15) NULL,
	med_extension	VARCHAR(5) NULL,
);

CREATE TABLE Tags(
	tag_id		INT PRIMARY KEY IDENTITY NOT NULL,
	tag_nom     VARCHAR(25) NOT NULL,
);

CREATE TABLE Roles(
	rol_id		INT PRIMARY KEY IDENTITY NOT NULL,
	rol_nom		VARCHAR(50) NOT NULL,
	rol_droit   VARCHAR(50) NOT NULL,
	rol_uti_id  INT NOT NULL,
	CONSTRAINT FK_UTILISATEUR_ROLES FOREIGN KEY (rol_uti_id) REFERENCES Utilisateur(uti_id)
);

CREATE TABLE Produit(
	pro_id			INT PRIMARY KEY IDENTITY NOT NULL,
	pro_libelle		VARCHAR(50) NOT NULL,
	pro_unite		INT NULL,
	pro_pics		VARCHAR(50) NULL,
	pro_uti_id		INT NOT NULL,
	CONSTRAINT FK_UTILISATEUR_PRODUIT FOREIGN KEY (pro_uti_id) REFERENCES Utilisateur(uti_id)
);

CREATE TABLE Recette(
	rec_id				INT PRIMARY KEY IDENTITY NOT NULL,
	rec_titre			VARCHAR(20) NOT NULL,
	rec_texte			TEXT NOT NULL,
	rec_pics			VARCHAR(50) NOT NULL,
	rec_liste			VARCHAR(50) NOT NULL,
	rec_compo_uti_id	INT NOT NULL,
	rec_valider_uti_id	INT NOT NULL
	CONSTRAINT FK_UTILISATEUR_RECETTE FOREIGN KEY (rec_compo_uti_id) REFERENCES Utilisateur(uti_id),
	CONSTRAINT FK_VALIDER_UTI_RECETTE FOREIGN KEY (rec_valider_uti_id) REFERENCES Utilisateur(uti_id)
);

CREATE TABLE Article(
	art_id		INT PRIMARY KEY IDENTITY NOT NULL,
	art_pics	VARCHAR(50) NOT NULL,
	art_titre	VARCHAR(50) NOT NULL,
	art_texte	TEXT NOT NULL,
	art_uti_id	INT NOT NULL,
	CONSTRAINT FK_UTILISATEUR_ARTICLE FOREIGN KEY (art_uti_id) REFERENCES Utilisateur(uti_id)
);

CREATE TABLE MessageForum(
	mes_id				INT PRIMARY KEY IDENTITY NOT NULL,
	mes_horodate		DATETIME NOT NULL,
	mes_texte			TEXT NOT NULL,
	mes_reponse_id_1	INT FOREIGN KEY REFERENCES MessageForum(mes_id) NULL,
	mes_uti_id			INT NOT NULL,
	CONSTRAINT FK_UTILISATEUR_MESSAGEFORUM FOREIGN KEY (mes_uti_id) REFERENCES Utilisateur(uti_id)
);

CREATE TABLE FicheProduit(
	fic_id				INT PRIMARY KEY IDENTITY NOT NULL,
	fic_libelle			VARCHAR(50) NOT NULL,
	fic_pics			VARCHAR(50) NOT NULL,
	fic_description		VARCHAR(50) NOT NULL,
	fic_pro_id			INT NOT NULL,
	fic_uti_id			INT NOT NULL,
	CONSTRAINT FK_PRODUIT_FICHEPRODUIT FOREIGN KEY (fic_pro_id) REFERENCES Produit(pro_id),
	CONSTRAINT FK_UTILISATEUR_FICHEPRODUIT FOREIGN KEY (fic_uti_id) REFERENCES Utilisateur(uti_id)
);


CREATE TABLE Contenir(
	con_rec_id		INT REFERENCES Recette(rec_id) NOT NULL,
	con_pro_id		INT REFERENCES Produit(pro_id) NOT NULL,
	CONSTRAINT PK_CONTENIR_RECETTE_PRODUIT PRIMARY KEY (con_rec_id, con_pro_id)
);

CREATE TABLE Associer(
	ass_rec_id		INT REFERENCES Recette(rec_id) NOT NULL,
	ass_tag_id		INT REFERENCES Tags(tag_id) NOT NULL,
	CONSTRAINT PK_ASSOCIER_RECETTE_TAGS PRIMARY KEY (ass_rec_id,ass_tag_id)
);

CREATE TABLE Embellir(
	emb_rec_id		INT REFERENCES Recette(rec_id) NOT NULL,
	emb_med_id		INT REFERENCES Media(med_id) NOT NULL,
	CONSTRAINT PK_EMBELLIR_RECETTE_MEDIA PRIMARY KEY (emb_rec_id, emb_med_id)
);

CREATE TABLE Montrer(
	mon_fic_id		INT REFERENCES FicheProduit(fic_id) NOT NULL,
	mon_tag_id		INT REFERENCES Tags(tag_id) NOT NULL,
	CONSTRAINT PK_MONTRER_FICHEPRODUIT_TAGS PRIMARY KEY (mon_fic_id, mon_tag_id)
);

CREATE TABLE Illustrer(
	ill_fic_id		INT REFERENCES FicheProduit(fic_id) NOT NULL,
	ill_med_id		INT REFERENCES Media(med_id) NOT NULL,
	CONSTRAINT PK_ILLUSTRER_FICHEPRODUIT_MEDIA PRIMARY KEY (ill_fic_id, ill_med_id)
);

CREATE TABLE Ameliorer(
	ame_art_id		INT REFERENCES Article(art_id) NOT NULL,
	ame_med_id		INT REFERENCES Media(med_id) NOT NULL,
	CONSTRAINT PK_AMELIORER_ARTICLE_MEDIA PRIMARY KEY (ame_art_id, ame_med_id)
);

CREATE TABLE Decrire(
	dec_art_id		INT REFERENCES Article(art_id) NOT NULL,
	dec_tag_id		INT REFERENCES Tags(tag_id) NOT NULL,
	CONSTRAINT PK_DECRIRE_ARTICLE_TAGS PRIMARY KEY (dec_art_id, dec_tag_id)
);

