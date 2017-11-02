USE db_libraryMS
GO

/* --------------------------------------
Creating and populating the "BOOK" table
--------------------------------------  */

CREATE TABLE dbo.BOOK 
(
	BookID INT NOT NULL IDENTITY (50001,1) PRIMARY KEY
	,Title NVARCHAR (100) NOT NULL
	,PublisherName NVARCHAR (100)
);


INSERT INTO dbo.BOOK 
	(Title, PublisherName)
	VALUES
	('Angels & Demons','Atria Books')
	,('Before We Were Yours','Thorndike Press')
	,('Being Mortal','Picador USA')
	,('Capital Gaines','W Publishing Group')
	,('Creepy Pair of Underwear!','Simon & Schuster Books')
	,('Deception Point','Washington Square Press')
	,('Deep Freeze','G.P. Putnam''s Sons')
	,('Digital Fortress','Knopf Doubleday Publishing Group')
	,('Discipline Equals Freedom: Field Manual','St. Martin''s Press')
	,('Don''t Let Go','E.P. Dutton')
	,('Dreamcatcher','Pocket Books')
	,('Everything Is Mama','Feiwel and Friends')
	,('Food Can Fix It','Scribner Book Company')
	,('Grit','Scribner Book Company')
	,('Hit Refresh','HarperCollins Publishers')
	,('How to Win Friends & Influence People','Pocket Books')
	,('Inferno','Knopf Doubleday Publishing Group')
	,('Invisible Influence','Simon & Schuster Books')
	,('It','Scribner Book Company')
	,('It Takes Two','Houghton Mifflin Harcourt Publishing')
	,('Life 3.0','Knopf Doubleday Publishing Group')
	,('Make Your Bed','Grand Central Publishing')
	,('Milk and Honey','CreateSpace')
	,('Misery','Signet')
	,('Nudge','Penguin Books USA')
	,('Origin','Knopf Doubleday Publishing Group')
	,('Pet Sematary','Pocket Books')
	,('Pete The Cat: Five Little Pumpkins','HarperCollins Publishers')
	,('Principles','Simon & Schuster Books')
	,('Rhett & Link''s Book of Mythicality','Crown Publishing Group')
	,('Rogue Heroes','Crown Publishing Group')
	,('Same Kind of Different as Me','W Publishing Group')
	,('Shantaram','St. Martin''s Press')
	,('The Cuban Affair','Thorndike Press')
	,('The Da Vinci Code','Knopf Doubleday Publishing Group')
	,('The Girl Who Takes An Eye For An Eye','Knopf Doubleday Publishing Group')
	,('The Glass Castle','Scribner Book Company')
	,('The Lost City of the Monkey God','Grand Central Publishing')
	,('The Lost Symbol','Knopf Doubleday Publishing Group')
	,('The Lost Tribe','Picador USA')
	,('The Mist','Signet')
	,('The Running Man','Pocket Books')
	,('The Shining','Knopf Doubleday Publishing Group')
	,('The Subtle Art of Not Giving A Fuck','Harper One')
	,('The Sun and Her Flowers','Andrews McMeel Publishing')
	,('The Wisdom of Sundays','Flatiron Books')
	,('The Wonderful Things You Will Be','Penguin Random House')
	,('Thinking, Fast and Slow','Farrar, Straus and Giroux')
	,('Tools of Titans','Houghton Mifflin Harcourt Publishing')
	,('You Are A Badass','Running Press')
;

SELECT * FROM dbo.BOOK


/* --------------------------------------
Creating and populating the BOOK_AUTHORS table
--------------------------------------  */

CREATE TABLE dbo.BOOK_AUTHORS
(	
	BOOKID INT NOT NULL 
		CONSTRAINT fk_BookID FOREIGN KEY 
		REFERENCES dbo.BOOK(BookID)
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	AuthorName VARCHAR(100) NOT NULL
);

INSERT INTO dbo.BOOK_AUTHORS
	(BOOKID, AuthorName)
	VALUES
	('50001','Dan Brown')
	,('50002','Lisa Wingate')
	,('50003','Atul Gawande')
	,('50004','Chip Gaines')
	,('50005','Aaron Reynolds')
	,('50006','Dan Brown')
	,('50007','John Sandford')
	,('50008','Dan Brown')
	,('50009','Jocko Willink')
	,('50010','Harlan Coben')
	,('50011','Stephen King')
	,('50012','Jimmy Fallon')
	,('50013','Mehmet Oz')
	,('50014','Angela Duckworth')
	,('50015','Satya Nadella')
	,('50016','Dale Carnegie')
	,('50017','Dan Brown')
	,('50018','Jonah Berger')
	,('50019','Stephen King')
	,('50020','Jonathan Scott')
	,('50021','Max Tegmark')
	,('50022','William H. McRaven')
	,('50023','Rupi Kaur')
	,('50024','Stephen King')
	,('50025','Richard H. Thaler and Cass R. Sunstein')
	,('50026','Dan Brown')
	,('50027','Stephen King')
	,('50028','James Dean')
	,('50029','Ray Dalio')
	,('50030','Rhett McLaughlin')
	,('50031','Ben Macintyre')
	,('50032','Ron Hall')
	,('50033','Gregory David Roberts')
	,('50034','Nelson DeMille')
	,('50035','Dan Brown')
	,('50036','David Lagercrantz')
	,('50037','Jeannette Walls')
	,('50038','Douglas J. Preston')
	,('50039','Dan Brown')
	,('50040','Mark Lee')
	,('50041','Stephen King')
	,('50042','Stephen King')
	,('50043','Stephen King')
	,('50044','Mark Manson')
	,('50045','Rupi Kaur')
	,('50046','Oprah Winfrey')
	,('50047','Emily Winfield Martin')
	,('50048','Daniel Kahneman')
	,('50049','Timothy Ferriss')
	,('50050','Jen Sincero');

SELECT * FROM dbo.BOOK_AUTHORS


/* --------------------------------------
Creating and populating the PUBLISHER table
--------------------------------------  */

CREATE TABLE dbo.PUBLISHER
(	
	Name NVARCHAR (100) NOT NULL PRIMARY KEY
	,Address NVARCHAR(255)
	,Phone VARCHAR(20)
);

INSERT INTO dbo.PUBLISHER
	(Name, Address,Phone)
	VALUES
	('Andrews McMeel Publishing','1130 Walnut St, Kansas City, MO 64106','(855) 885-2883')
	,('Atria Books','1230 6th Ave, New York, NY 10020','(212) 698-7086')
	,('CreateSpace','7290 Investment Dr., North Charleston, SC 29418','(843) 760-8000')
	,('Crown Publishing Group','1745 Broadway, New York, NY 10019','(212) 782-9000')
	,('E.P. Dutton','375 Hudson St, New York, NY 10014','(212) 366-2792')
	,('Farrar, Straus and Giroux','18 W 18th St, New York, NY 10011','(212) 741-6900')
	,('Feiwel and Friends','175 5th Ave, New York, NY 10010','(212) 674-5151')
	,('Flatiron Books','175 Fifth Avenue, 21st floor, New York, NY 10010','(646) 307-5048')
	,('G.P. Putnam''s Sons','375 Hudson St, New York, NY 10014','(212) 366-2000')
	,('Grand Central Publishing','1290 Avenue Of The Americas, New York, NY 10104 ','(212) 364-1200')
	,('Harper One','201 California St, San Francisco, CA 94111','(415) 477-4400')
	,('HarperCollins Publishers','195 Broadway, New York, NY 10007','(212) 207-7000')
	,('Houghton Mifflin Harcourt Publishing','3 Park Ave, New York, NY 10016','(212) 420-5800')
	,('Knopf Doubleday Publishing Group','1745 Broadway, New York, NY 10019','(212) 940-7390')
	,('Penguin Books USA','375 Hudson St, New York, NY 10014','(212) 366-2385')
	,('Penguin Random House','1745 Broadway, New York, NY 10019','(212) 782-9000')
	,('Picador USA','175 5th Ave, New York, NY 10010','(800) 221-7945')
	,('Pocket Books','1230 Avenue of the Americas, New York, NY 10020 ','(212) 698-7000')
	,('Running Press','2300 Chestnut St # 200, Philadelphia, PA 19103','(215) 558-4133')
	,('Scribner Book Company','1230 Avenue of the Americas, New York, NY 10020 ','(212) 632-4915')
	,('Signet','375 Hudson St, New York, NY 10014','(212) 366-2385')
	,('Simon & Schuster Books','1230 6th Ave, New York, NY 10020','(212) 698-7000')
	,('St. Martin''s Press','175 Fifth Avenue, 21st floor, New York, NY 10010','(212) 674-5151')
	,('Thorndike Press','10 Water St, Ste 310, Waterville, Maine 04901-4539','(800) 223-1244')
	,('W Publishing Group','501 Nelson Pl, Nashville, TN 37214','(615) 902-2600')
	,('Washington Square Press','1230 Avenue of the Americas, New York, NY 10020 ','(212) 698-7000');

SELECT * FROM dbo.PUBLISHER



/* --------------------------------------
Creating and populating the BORROWER table
--------------------------------------  */

CREATE TABLE dbo.BORROWER
(	
	CardNo INT NOT NULL IDENTITY (18001,1) PRIMARY KEY
	,Name_First NVARCHAR(50)
	,Name_Last NVARCHAR (50)
	,Address NVARCHAR (200)
	,Phone VARCHAR(20)
);


INSERT INTO dbo.BORROWER
	(Name_First, Name_Last, Address, Phone)
	VALUES
	('Jasper','Jones','340 Jasper Court','(123) 456-7899')
	,('Cindy','Styles','998 Stylist Lane','(123) 435-6789')
	,('Mark ','Ingram','323 Ingram Road','(123) 332-4455')
	,('Stacie','Smith','445 Smith Cove','(123) 667-7889')
	,('Stacie','Jones','847 Jones Landing','(123) 009-8789')
	,('Samson','McKinley','665 McKinley Drive','(123) 567-8300')
	,('Aaron','Sparks','873 Sparks Avenue','(123) 900-4998')
	,('Justine','Cook','8733 Tempest Boulevard','(123) 764-8990')
	,('Ryan','Braids','4335 Braider Lane','(123) 776-4499')
	,('Ben','Forest','772 Forest Road','(123) 774-8940')
	,('Leslie','Appel','2876 Lenses Court','(123) 333-6666')
	,('Denise','Fadl','655 Jackson Street','(123) 999-7685')
	,('Mike','James','1343 SW Junction Avenue','(123) 332-5532')
	,('Mason','Sparks','6633 Sparks Street','(123) 399-3887')
	,('Diane','Mason','98 Court Junction','(123) 464-6758')
	,('Eric','Spelling','777 Session Boulevard','(123) 987-3546')
	,('Jonathan','Ross','543 Ross Strand','(123) 897-6549')
	,('Monica','Laurant','676 Stylist Lane','(123) 984-0040')
	,('Carl','Smith','99 Grant Avenue','(123) 909-0808')
	,('Grant','Summer','8765 Tempest Boulevard','(123) 667-4400')
	,('Jessica','Roberts','883 Forest Road','(123) 789-7654')
	,('Brent','Simpson','352 Ingram Road','(123) 677-7444')
	,('Claire','Franks','450 Jasper Court','(123) 556-7484')
	,('Albert ','Stein','644 Jackson Street','(123) 888-7776')
	,('Ross','Wells','890 Jones Landing','(123) 777-8887')
	,('Tim','Weston','5544 Fort Avenue','(123) 657-3083')
	,('Gary','Smalls','3299 Braider Lane','(123) 445-5667')
	,('Simon ','Finkle','800 Session Boulevard','(123) 094-5056')
	,('Freddy','Jones','700 McKinley Drive','(123) 787-8650');

SELECT * FROM dbo.BORROWER




/* --------------------------------------
Creating and populating the LIBRARY _BRANCH table
--------------------------------------  */

CREATE TABLE dbo.LIBRARY_BRANCH
(	
	BranchID INT NOT NULL IDENTITY (97010,1) PRIMARY KEY
	,BranchName NVARCHAR(50) NOT NULL
	,BranchAddress NVARCHAR (100)
);

INSERT INTO dbo.LIBRARY_BRANCH
	(BranchName,BranchAddress)
	VALUES
	('Central','125 Central City Lane')
	,('Salem','452 Salem Avenue')
	,('Mars','9900 Mars Street')
	,('Sharpstown','101 South Sharpstown')
	,('Port Stuart','898 SW Port Stuart Drive')
	,('Eccles','334 Eccles Road')
	,('Cyan','55 Cyan Boulevard');

SELECT * FROM dbo.LIBRARY_BRANCH



/* --------------------------------------
Creating and populating the BOOK_COPIES table
--------------------------------------  */

CREATE TABLE dbo.BOOK_COPIES
(	
	BookID INT NOT NULL 
		CONSTRAINT fk_BookIDQty FOREIGN KEY
		REFERENCES dbo.BOOK(BookID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	,BranchID INT NOT NULL
		CONSTRAINT fk_BranchIDQty FOREIGN KEY 
		REFERENCES dbo.LIBRARY_BRANCH(BranchID)
		ON UPDATE CASCADE 
		ON DELETE CASCADE
	,No_Of_Copies INT NOT NULL
);


INSERT INTO dbo.BOOK_COPIES
	(BookID,BranchID,No_Of_Copies)
	VALUES
	(50001,97010,2)
	,(50001,97011,5)
	,(50001,97012,4)
	,(50001,97013,7)
	,(50001,97014,7)
	,(50001,97015,6)
	,(50001,97016,4)
	,(50002,97010,5)
	,(50002,97011,6)
	,(50002,97012,5)
	,(50002,97013,2)
	,(50002,97014,2)
	,(50002,97015,3)
	,(50002,97016,3)
	,(50003,97010,4)
	,(50003,97011,7)
	,(50003,97012,6)
	,(50003,97013,4)
	,(50003,97014,4)
	,(50003,97015,7)
	,(50003,97016,5)
	,(50004,97010,6)
	,(50004,97011,4)
	,(50004,97012,7)
	,(50004,97013,5)
	,(50004,97014,5)
	,(50004,97015,2)
	,(50004,97016,2)
	,(50005,97010,7)
	,(50005,97011,5)
	,(50005,97012,7)
	,(50005,97013,6)
	,(50005,97014,6)
	,(50005,97015,5)
	,(50005,97016,3)
	,(50006,97010,3)
	,(50006,97011,3)
	,(50006,97012,6)
	,(50006,97013,7)
	,(50006,97014,7)
	,(50006,97015,4)
	,(50006,97016,4)
	,(50007,97010,2)
	,(50007,97011,7)
	,(50007,97012,5)
	,(50007,97013,4)
	,(50007,97014,4)
	,(50007,97015,6)
	,(50007,97016,5)
	,(50008,97010,6)
	,(50008,97011,8)
	,(50008,97012,4)
	,(50008,97013,6)
	,(50008,97014,6)
	,(50008,97015,7)
	,(50008,97016,6)
	,(50009,97010,4)
	,(50009,97011,7)
	,(50009,97012,7)
	,(50009,97013,3)
	,(50009,97014,3)
	,(50009,97015,3)
	,(50009,97016,7)
	,(50010,97010,3)
	,(50010,97011,2)
	,(50010,97012,3)
	,(50010,97013,7)
	,(50010,97014,7)
	,(50010,97015,2)
	,(50010,97016,7)
	,(50011,97010,5)
	,(50011,97011,4)
	,(50011,97012,2)
	,(50011,97013,3)
	,(50011,97014,2)
	,(50011,97015,4)
	,(50011,97016,6)
	,(50012,97010,2)
	,(50012,97011,5)
	,(50012,97012,2)
	,(50012,97013,4)
	,(50012,97014,3)
	,(50012,97015,4)
	,(50012,97016,5)
	,(50013,97010,3)
	,(50013,97011,6)
	,(50013,97012,2)
	,(50013,97013,5)
	,(50013,97014,2)
	,(50013,97015,3)
	,(50013,97016,4)
	,(50014,97010,4)
	,(50014,97011,7)
	,(50014,97012,2)
	,(50014,97013,6)
	,(50014,97014,2)
	,(50014,97015,3)
	,(50014,97016,5)
	,(50015,97010,5)
	,(50015,97011,4)
	,(50015,97012,3)
	,(50015,97013,7)
	,(50015,97014,2)
	,(50015,97015,2)
	,(50015,97016,6)
	,(50016,97010,6)
	,(50016,97011,6)
	,(50016,97012,3)
	,(50016,97013,7)
	,(50016,97014,2)
	,(50016,97015,2)
	,(50016,97016,7)
	,(50017,97010,7)
	,(50017,97011,3)
	,(50017,97012,4)
	,(50017,97013,6)
	,(50017,97014,2)
	,(50017,97015,6)
	,(50017,97016,4)
	,(50018,97010,7)
	,(50018,97011,7)
	,(50018,97012,4)
	,(50018,97013,5)
	,(50018,97014,2)
	,(50018,97015,6)
	,(50018,97016,5)
	,(50019,97010,6)
	,(50019,97011,2)
	,(50019,97012,5)
	,(50019,97013,5)
	,(50019,97014,5)
	,(50019,97015,4)
	,(50019,97016,3)
	,(50020,97010,5)
	,(50020,97011,3)
	,(50020,97012,5)
	,(50020,97013,4)
	,(50020,97014,5)
	,(50020,97015,5)
	,(50020,97016,7)
	,(50021,97010,4)
	,(50021,97011,7)
	,(50021,97012,2)
	,(50021,97013,6)
	,(50021,97014,5)
	,(50021,97015,6)
	,(50021,97016,8)
	,(50022,97010,3)
	,(50022,97011,2)
	,(50022,97012,2)
	,(50022,97013,7)
	,(50022,97014,3)
	,(50022,97015,7)
	,(50022,97016,7)
	,(50023,97010,2)
	,(50023,97011,4)
	,(50023,97012,7)
	,(50023,97013,3)
	,(50023,97014,3)
	,(50023,97015,7)
	,(50023,97016,2)
	,(50024,97010,3)
	,(50024,97011,5)
	,(50024,97012,7)
	,(50024,97013,2)
	,(50024,97014,3)
	,(50024,97015,6)
	,(50024,97016,4)
	,(50025,97010,4)
	,(50025,97011,6)
	,(50025,97012,4)
	,(50025,97013,2)
	,(50025,97014,4)
	,(50025,97015,5)
	,(50025,97016,5)
	,(50026,97010,5)
	,(50026,97011,7)
	,(50026,97012,4)
	,(50026,97013,2)
	,(50026,97014,4)
	,(50026,97015,4)
	,(50026,97016,6)
	,(50027,97010,6)
	,(50027,97011,4)
	,(50027,97012,3)
	,(50027,97013,2)
	,(50027,97014,4)
	,(50027,97015,2)
	,(50027,97016,7)
	,(50028,97010,7)
	,(50028,97011,6)
	,(50028,97012,3)
	,(50028,97013,2)
	,(50028,97014,4)
	,(50028,97015,2)
	,(50028,97016,4)
	,(50029,97010,2)
	,(50029,97011,3)
	,(50029,97012,5)
	,(50029,97013,2)
	,(50029,97014,4)
	,(50029,97015,4)
	,(50029,97016,6)
	,(50030,97010,4)
	,(50030,97011,7)
	,(50030,97012,6)
	,(50030,97013,3)
	,(50030,97014,2)
	,(50030,97015,4)
	,(50030,97016,3)
	,(50031,97010,5)
	,(50031,97011,2)
	,(50031,97012,3)
	,(50031,97013,3)
	,(50031,97014,2)
	,(50031,97015,4)
	,(50031,97016,7)
	,(50032,97010,6)
	,(50032,97011,2)
	,(50032,97012,2)
	,(50032,97013,3)
	,(50032,97014,2)
	,(50032,97015,4)
	,(50032,97016,2)
	,(50033,97010,7)
	,(50033,97011,2)
	,(50033,97012,3)
	,(50033,97013,3)
	,(50033,97014,7)
	,(50033,97015,4)
	,(50033,97016,3)
	,(50034,97010,4)
	,(50034,97011,4)
	,(50034,97012,4)
	,(50034,97013,4)
	,(50034,97014,7)
	,(50034,97015,5)
	,(50034,97016,2)
	,(50035,97010,6)
	,(50035,97011,5)
	,(50035,97012,3)
	,(50035,97013,4)
	,(50035,97014,3)
	,(50035,97015,5)
	,(50035,97016,4)
	,(50036,97010,3)
	,(50036,97011,6)
	,(50036,97012,5)
	,(50036,97013,4)
	,(50036,97014,4)
	,(50036,97015,5)
	,(50036,97016,5)
	,(50037,97010,7)
	,(50037,97011,3)
	,(50037,97012,2)
	,(50037,97013,4)
	,(50037,97014,5)
	,(50037,97015,4)
	,(50037,97016,6)
	,(50038,97010,2)
	,(50038,97011,3)
	,(50038,97012,3)
	,(50038,97013,4)
	,(50038,97014,6)
	,(50038,97015,5)
	,(50038,97016,7)
	,(50039,97010,3)
	,(50039,97011,3)
	,(50039,97012,4)
	,(50039,97013,4)
	,(50039,97014,7)
	,(50039,97015,4)
	,(50039,97016,4)
	,(50040,97010,6)
	,(50040,97011,5)
	,(50040,97012,5)
	,(50040,97013,5)
	,(50040,97014,7)
	,(50040,97015,6)
	,(50040,97016,6)
	,(50041,97010,4)
	,(50041,97011,5)
	,(50041,97012,6)
	,(50041,97013,5)
	,(50041,97014,6)
	,(50041,97015,7)
	,(50041,97016,3)
	,(50042,97010,7)
	,(50042,97011,5)
	,(50042,97012,7)
	,(50042,97013,5)
	,(50042,97014,5)
	,(50042,97015,3)
	,(50042,97016,7)
	,(50043,97010,4)
	,(50043,97011,2)
	,(50043,97012,7)
	,(50043,97013,2)
	,(50043,97014,2)
	,(50043,97015,2)
	,(50043,97016,2)
	,(50044,97010,7)
	,(50044,97011,2)
	,(50044,97012,6)
	,(50044,97013,2)
	,(50044,97014,2)
	,(50044,97015,3)
	,(50044,97016,7)
	,(50045,97010,3)
	,(50045,97011,2)
	,(50045,97012,5)
	,(50045,97013,2)
	,(50045,97014,2)
	,(50045,97015,2)
	,(50045,97016,2)
	,(50046,97010,4)
	,(50046,97011,4)
	,(50046,97012,4)
	,(50046,97013,7)
	,(50046,97014,2)
	,(50046,97015,2)
	,(50046,97016,4)
	,(50047,97010,5)
	,(50047,97011,4)
	,(50047,97012,2)
	,(50047,97013,7)
	,(50047,97014,2)
	,(50047,97015,2)
	,(50047,97016,5)
	,(50048,97010,2)
	,(50048,97011,3)
	,(50048,97012,5)
	,(50048,97013,7)
	,(50048,97014,2)
	,(50048,97015,2)
	,(50048,97016,6)
	,(50049,97010,2)
	,(50049,97011,3)
	,(50049,97012,4)
	,(50049,97013,2)
	,(50049,97014,3)
	,(50049,97015,3)
	,(50049,97016,7)
	,(50050,97010,2)
	,(50050,97011,4)
	,(50050,97012,6)
	,(50050,97013,2)
	,(50050,97014,3)
	,(50050,97015,3)
	,(50050,97016,4);

SELECT * FROM dbo.BOOK_COPIES



/* --------------------------------------
Creating and populating the BOOK_LOANS table
--------------------------------------  */

CREATE TABLE dbo.BOOK_LOANS
(	
	BookID INT NOT NULL 
		CONSTRAINT fk_BookIDLoans FOREIGN KEY
		REFERENCES dbo.BOOK(BookID)
		ON UPDATE CASCADE 
		ON DELETE CASCADE
	,BranchID INT NOT NULL 
		CONSTRAINT fk_BranchIDLoans FOREIGN KEY
		REFERENCES dbo.LIBRARY_BRANCH(BranchID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	,CardNo INT NOT NULL
		CONSTRAINT fk_CardNoLoans FOREIGN KEY
		REFERENCES dbo.BORROWER(CardNo)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	,Date_Out DATE
	,Date_Due DATE
);


INSERT INTO dbo.BOOK_LOANS
	(BookID,BranchID,CardNo,Date_Out,Date_Due)
	VALUES
	(50027,97013,18001,'2017-07-21','2017-08-05')
	,(50001,97010,18002,'2017-08-01','2017-08-16')
	,(50032,97016,18003,'2016-12-12','2016-12-27')
	,(50007,97011,18003,'2017-01-10','2017-01-25')
	,(50019,97011,18003,'2017-05-06','2017-05-21')
	,(50002,97013,18003,'2017-09-05','2017-09-20')
	,(50039,97013,18003,'2017-09-07','2017-09-22')
	,(50040,97010,18003,'2017-10-27','2017-11-11')
	,(50048,97010,18004,'2017-09-03','2017-09-18')
	,(50021,97012,18005,'2017-10-15','2017-10-30')
	,(50005,97010,18006,'2017-10-14','2017-10-29')
	,(50009,97013,18007,'2017-05-17','2017-06-01')
	,(50007,97015,18008,'2017-09-18','2017-10-03')
	,(50032,97016,18009,'2017-09-28','2017-10-13')
	,(50001,97010,18009,'2017-09-30','2017-10-15')
	,(50019,97011,18009,'2017-10-01','2017-10-16')
	,(50009,97014,18009,'2017-10-12','2017-10-27')
	,(50040,97011,18009,'2017-10-12','2017-10-27')
	,(50027,97013,18009,'2017-10-29','2017-11-13')
	,(50039,97010,18009,'2017-10-29','2017-11-13')
	,(50021,97010,18010,'2017-09-18','2017-10-03')
	,(50007,97015,18011,'2017-09-12','2017-09-27')
	,(50048,97015,18012,'2017-10-03','2017-10-18')
	,(50001,97013,18013,'2017-10-21','2017-11-05')
	,(50002,97014,18014,'2017-10-23','2017-11-07')
	,(50009,97012,18015,'2017-09-30','2017-10-15')
	,(50007,97015,18015,'2017-10-15','2017-10-30')
	,(50019,97014,18015,'2017-10-19','2017-11-03')
	,(50005,97010,18015,'2017-10-21','2017-11-05')
	,(50040,97012,18016,'2017-10-05','2017-10-20')
	,(50005,97014,18016,'2017-10-05','2017-10-20')
	,(50039,97013,18017,'2017-10-21','2017-11-05')
	,(50005,97014,18017,'2017-10-21','2017-11-05')
	,(50027,97016,18019,'2017-10-29','2017-11-13')
	,(50013,97012,18019,'2017-10-29','2017-11-13')
	,(50013,97012,18021,'2017-10-15','2017-10-30')
	,(50001,97011,18021,'2017-10-15','2017-10-30')
	,(50048,97013,18021,'2017-10-23','2017-11-07')
	,(50027,97016,18021,'2017-10-29','2017-11-13')
	,(50015,97015,18021,'2017-10-29','2017-11-13')
	,(50027,97012,18022,'2017-10-12','2017-10-27')
	,(50021,97011,18022,'2017-10-12','2017-10-27')
	,(50002,97014,18022,'2017-10-15','2017-10-30')
	,(50001,97013,18022,'2017-10-16','2017-10-31')
	,(50031,97013,18022,'2017-10-17','2017-11-01')
	,(50040,97013,18022,'2017-10-17','2017-11-01')
	,(50019,97013,18022,'2017-10-18','2017-11-02')
	,(50007,97010,18025,'2017-10-29','2017-11-13')
	,(50048,97011,18026,'2017-10-15','2017-10-30')
	,(50013,97014,18027,'2017-10-23','2017-11-07')
	,(50039,97010,18027,'2017-10-23','2017-11-07')
	,(50021,97013,18027,'2017-10-23','2017-11-07')
	,(50040,97014,18029,'2017-10-02','2017-10-17')
	,(50019,97015,18029,'2017-10-07','2017-10-22')
	,(50015,97015,18029,'2017-10-09','2017-10-24')
	,(50013,97014,18029,'2017-10-22','2017-11-06')
	,(50032,97013,18029,'2017-10-29','2017-11-13')
	,(50039,97011,18029,'2017-10-29','2017-11-13')
;

SELECT * FROM dbo.BOOK_LOANS
