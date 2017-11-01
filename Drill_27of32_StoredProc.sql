/* -------------------------
1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? 
----------------------------*/

--To search for copies specifically for "The Lost Tribe" at "Sharpstown"

USE db_libraryMS
GO

CREATE PROC sp1LostAtSharp
AS
BEGIN
	SELECT bkname.Title, libname.BranchName, qty.No_Of_Copies
	FROM 
		dbo.BOOK bkname 
		INNER JOIN dbo.BOOK_COPIES qty ON bkname.BookID=qty.BookID
		INNER JOIN dbo.LIBRARY_BRANCH libname ON libname.BranchID=qty.BranchID
	WHERE
		Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
END


--To search for copies of any book title and at any branch name

USE db_libraryMS
GO

CREATE PROC spAnyBookAndBranch
	(
	@Title nvarchar(100)
	, @BranchName nvarchar(100)
	)
AS
BEGIN
	SELECT bkname.Title, libname.BranchName, qty.No_Of_Copies
	FROM 
		dbo.BOOK bkname 
		INNER JOIN dbo.BOOK_COPIES qty ON bkname.BookID=qty.BookID
		RIGHT JOIN dbo.LIBRARY_BRANCH libname ON libname.BranchID=qty.BranchID
	WHERE
		Title LIKE '%' + @Title + '%' AND 
		BranchName LIKE '%' + @BranchName + '%' 

END



/* -------------------------
2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? 
-------------------------*/


--To search for all quantities of "The Lost Tribe owned by each branch

USE db_libraryMS
GO

CREATE PROC sp2AllLostCopySearch
AS

BEGIN
	SELECT bkname.Title, libname.BranchName, qty.No_Of_Copies
		FROM 
			dbo.BOOK bkname 
			INNER JOIN dbo.BOOK_COPIES qty ON bkname.BookID=qty.BookID
			RIGHT JOIN dbo.LIBRARY_BRANCH libname ON libname.BranchID=qty.BranchID
		WHERE
			Title = 'The Lost Tribe'
END


--To search for all quantity of any book owned by each branch

USE db_libraryMS
GO

CREATE PROC spAnyCopySeach
	(
	@Title nvarchar(100)
	)
AS
BEGIN
	SELECT bkname.Title, libname.BranchName, qty.No_Of_Copies
		FROM 
			dbo.BOOK bkname 
			INNER JOIN dbo.BOOK_COPIES qty ON bkname.BookID=qty.BookID
			RIGHT JOIN dbo.LIBRARY_BRANCH libname ON libname.BranchID=qty.BranchID
		WHERE
			Title LIKE '%' + @Title + '%'  
END




/* -------------------------
3. Retrieve the names of all borrowers who do not have any books checked out. 
-------------------------*/

USE db_libraryMS
GO

CREATE PROC sp3NoBooksOut
AS
BEGIN
	SELECT *
	FROM BORROWER LEFT JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	WHERE BOOK_LOANS.CardNo IS NULL
END




/* -------------------------
4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. 
-------------------------*/

--Check for borrower's info who has books loaned out from Sharpstown due today. I'm using CAST function and CURRENT_TIMESTAMP to represent "today's date per the system". "As date" represent the data type. Note that you will have to adjust your system date, depending on when you check this project

USE db_libraryMS
GO

CREATE PROC sp4ChkDueSharpstown
AS

BEGIN
	SELECT 
		libname.BranchName
		,loan.Date_Due
		,bkname.Title
		,mem.Name_First
		,mem.Name_Last
		,mem.Address
	FROM 
		LIBRARY_BRANCH libname
		INNER JOIN BOOK_LOANS loan ON libname.BranchID = loan.BranchID
		JOIN BOOK bkname ON bkname.BookID = loan.BookID
		INNER JOIN BORROWER mem ON mem.CardNo=loan.CardNo
	WHERE 
		BranchName = 'Sharpstown' AND
		Date_Due = CAST(CURRENT_TIMESTAMP AS date)
END



--Using CAST function and CURRENT_TIMESTAMP to represent "today's date per the system". "As date" represent the data type. The stored procedured below will retrieve all borrowers' names with books due today at a specified Branch Name.

USE db_libraryMS
GO

CREATE PROC spChkAllDueAllLib
	(
	@BranchName nvarchar(100)
	)
AS

BEGIN
	SELECT 
		libname.BranchName
		,loan.Date_Due
		,bkname.Title
		,mem.Name_First
		,mem.Name_Last
		,mem.Address
	FROM 
		LIBRARY_BRANCH libname
		INNER JOIN BOOK_LOANS loan ON libname.BranchID = loan.BranchID
		JOIN BOOK bkname ON bkname.BookID = loan.BookID
		INNER JOIN BORROWER mem ON mem.CardNo=loan.CardNo
	WHERE 
		BranchName LIKE '%' + @BranchName + '%' AND
		Date_Due = CAST(CURRENT_TIMESTAMP AS date)
END
		



/* -------------------------
5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch 
-------------------------*/


USE db_libraryMS
GO

CREATE PROC sp5QtyBooksLoaned
AS
BEGIN
	SELECT 
		libname.BranchName
		,COUNT(loan.Date_Out) AS BooksLoaned
	FROM 
		LIBRARY_BRANCH libname
		INNER JOIN BOOK_LOANS loan ON libname.BranchID = loan.BranchID
	GROUP BY BranchName
END





/* -------------------------
6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. 
--------------------------*/

USE db_libraryMS
GO

CREATE PROC sp6MoreThanFiveOut
AS

BEGIN
	SELECT
		mem.Name_First + ' '+ mem.Name_Last AS [Name]
		, mem.Address
		, COUNT(loan.CardNo) AS [TotalCkdOut]

	FROM
		BORROWER AS mem
		FULL OUTER JOIN BOOK_LOANS AS loan ON mem.CardNo=loan.CardNo
	GROUP BY mem.Name_First
		,mem.Name_Last
		,mem.Address
	HAVING
		COUNT(loan.CardNo) > 5
END





/* -------------------------
7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central" 
-------------------------*/

USE db_libraryMS
GO

CREATE PROC sp7CentralQtySKING
AS

BEGIN
	SELECT 
		bkname.Title
		,author.AuthorName
		,copy.No_Of_Copies
		,libname.BranchName
	FROM
		BOOK AS bkname
		INNER JOIN BOOK_COPIES AS copy ON bkname.BookID=copy.BookID
		INNER JOIN BOOK_AUTHORS AS author ON bkname.BookID = author.BookID
		INNER JOIN LIBRARY_BRANCH AS libname ON libname.BranchID = copy.BranchID
	WHERE 
		AuthorName = 'Stephen King' AND
		 BranchName = 'Central'
END