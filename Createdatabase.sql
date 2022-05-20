Create DATABASE DemoDB
Go
CREATE TABLE PIProduct			
(
    PIID int PRIMARY KEY IDENTITY(1,1),
    PIName	        	nvarchar(50)    NOT NULL,
    PISize	        	float           NOT NULL,
	PIGroup				nvarchar(50)	NOT NULL,
    PIIngredient_1		int	            NULL,
    PIIngredient_2		int	            NULL,
    PIIngredient_3		int	            NULL,
    PIPx	        	nvarchar(4)     NOT NULL,
    PIIngredientamount	int				NOT NULL,
    PIQuantity 			int	            NOT NULL,
	PIImage 			NVARCHAR(256) 	NULL,
	PIImageFile 		VARBINARY(MAX) 	NULL,
	--Selfreference to store 3 depending ingredients
    FOREIGN KEY (PIIngredient_1) REFERENCES PIProduct (PIID),
    FOREIGN KEY (PIIngredient_2) REFERENCES PIProduct (PIID),
    FOREIGN KEY (PIIngredient_3) REFERENCES PIProduct (PIID)
);
Go
--now we insert some data into the table
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Aqueous Liquids',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Liquid-Gas - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Autotrophs',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Organic - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Base Metals',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Solid - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Carbon Compounds',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Organic - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Complex Organisms',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Organic - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Felsic Magma',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Solid - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Heavy Metals',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Solid - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Ionic Solutions',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Liquid-Gas - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Micro Organisms',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Organic - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Noble Gas',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Liquid-Gas - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Noble Metals',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Solid - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Non-CS Crystals',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Solid - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Planktic Colonies',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Organic - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Reactive Gas',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Liquid-Gas - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Suspended Plasma',0.01,'P0',NULL,NULL,NULL,0,0,'Planet Liquid-Gas - Raw Resource')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Water',0.38,'P1',1,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Industrial Fibers',0.38,'P1',2,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Reactive Metals',0.38,'P1',3,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Biofuels',0.38,'P1',4,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Proteins',0.38,'P1',5,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Silicon',0.38,'P1',6,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Toxic Metals',0.38,'P1',7,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Electrolytes',0.38,'P1',8,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Bacteria',0.38,'P1',9,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Oxygen',0.38,'P1',10,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES(' Precious Metals',0.38,'P1',11,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Chiral Structures',0.38,'P1',12,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Biomass',0.38,'P1',13,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Oxidizing Compound',0.38,'P1',14,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Plasmoids',0.38,'P1',15,NULL,NULL,3000,20,'Basic Commodities - Tier 1')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Biocells',1.5,'P2',19,26,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Construction Blocks',1.5,'P2',18,22,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Consumer Electronics',1.5,'P2',27,22,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Coolant',1.5,'P2',23,16,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Enriched Uranium',1.5,'P2',26,22,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Fertilizer',1.5,'P2',24,20,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Genetically Enhanced Livestock',1.5,'P2',28,20,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Livestock',1.5,'P2',19,20,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Mechanical Parts',1.5,'P2',26,18,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Microfiber Shielding',1.5,'P2',17,21,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Miniature Electronics',1.5,'P2',27,21,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Nanites',1.5,'P2',24,18,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Oxides',1.5,'P2',29,25,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Polyaramids',1.5,'P2',17,29,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Polytextiles',1.5,'P2',19,17,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Rocket Fuel',1.5,'P2',23,30,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Silicate Glass',1.5,'P2',29,21,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Super conductors',1.5,'P2',30,16,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Supertensile Plastics',1.5,'P2',28,25,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Synthetic Oil',1.5,'P2',23,25,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Test Cultures',1.5,'P2',24,16,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Transmitter',1.5,'P2',27,30,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Viral Agent',1.5,'P2',24,28,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Water-Cooled CPU',1.5,'P2',18,16,NULL,40,5,'Refined Commodities - Tier 2')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Neocoms',6,'P3',31,47,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('High-Tech Transmitters',6,'P3',44,52,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Data Chips',6,'P3',49,40,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Gel-Matrix Biopaste',6,'P3',31,43,48,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Hazmat Detection Systems',6,'P3',45,52,53,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Planetary Vehicles',6,'P3',39,41,49,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Industrial Explosives',6,'P3',36,45,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Ukomi Superconductors',6,'P3',48,50,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Condensates',6,'P3',34,43,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Robotics',6,'P3',33,39,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Smartfab Units',6,'P3',32,41,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Vaccines',6,'P3',38,53,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Transcranial Microcontrollers',6,'P3',31,42,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Synthetic Synapses',6,'P3',49,51,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Guidance Systems',6,'P3',52,54,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Hermetic Membranes',6,'P3',37,44,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Camera Drones',6,'P3',46,47,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Nuclear Reactors',6,'P3',35,40,NULL,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Biotech Research Reports',6,'P3',32,38,42,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Cryoprotectant Solution',6,'P3',36,50,51,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Supercomputers',6,'P3',33,34,54,10,3,'Specialized Commodities - Tier 3')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Broadcast Node',100,'P4',55,56,57,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Integrity Response Drones ',100,'P4',58,59,60,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Nano-Factory ',100,'P4',61,62,18,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Organic Mortar Applicators ',100,'P4',63,64,24,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Sterile Conduits ',100,'P4',65,66,16,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Recursive Computing Module ',100,'P4',67,68,69,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Self-Harmonizing Power Core ',100,'P4',70,71,72,6,1,'Advanced Commodities - Tier 4')
INSERT INTO PIProduct(PIName,PISize,PIPx,PIIngredient_1,PIIngredient_2,PIIngredient_3,PIIngredientamount,PIQuantity,PIGroup) VALUES('Wetware Mainframe ',100,'P4',73,74,75,6,1,'Advanced Commodities - Tier 4')


