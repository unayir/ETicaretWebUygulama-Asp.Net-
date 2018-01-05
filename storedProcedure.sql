--------------------------------------
---------Category Procedure-----------
Go
Create Procedure pr_Categories_List
as
Select * From Categories

--------------------------------------
Go
Create Procedure pr_Categories_Insert
(
	@CategoryID int,
	@CategoryName nvarchar(15)
)as
Begin
Insert Into Categories
Values
(@CategoryName)
End

----------------------------------------------
Go
Create Procedure pr_Categories_Update
(
	@CategoryID int,
	@CategoryName nvarchar(15)
)as
Begin
Update Categories
Set CategoryName = @CategoryName
Where CategoryID = @CategoryID
End

-------------------------------------------
Go
Create Procedure pr_Categories_Delete
(
	@CategoryID int
)as
IF not exists (Select * From Products Where CategoryID = @CategoryID)
Begin
Delete From Categories
Where CategoryID = @CategoryID
End

--------------------------------------------
Go
Create Procedure pr_ProductsOfCategory_Delete
(
	@CategoryID int
)as
IF exists (Select * From Products Where CategoryID = @categoryID)
Begin
Delete From Products
Where CategoryID = @CategoryID
End
--------------------------------
------------Products------------
Go
Create Procedure pr_Products_List
as
Select * From Products

--------------------------------
Go
Create Procedure pr_NewProducts_List
as
Select Top 4 * From Products order by ProductId desc
--------------------------------
Go
Create Proc pr_Products_Insert
(
	@ProductID int,
	@ProductName nvarchar(40),
	@Description nvarchar(40),
	@CategoryID int,
	@UnitPrice money,
	@UnitsInStock int,
	@SmallPhotoPath nvarchar(250),
	@LargePhotoPath nvarchar(250)
)as
Begin
Insert Into Products
(ProductName, Description, CategoryID, UnitPrice, UnitsInStock, SmallPhotoPath, LargePhotoPath)
Values
(@ProductName, @Description, @CategoryID, @UnitPrice, @UnitsInStock, @SmallPhotoPath, @LargePhotoPath)
End

---------------------------------
Go
Create Proc pr_Products_Update
(
	@ProductID int,
	@ProductName nvarchar(40),
	@Description nvarchar(40),
	@CategoryID int,
	@UnitPrice money,
	@UnitsInStock int,
	@SmallPhotoPath nvarchar(250),
	@LargePhotoPath nvarchar(250)
)as
Begin
Update Products
Set ProductName = @ProductName,
	CategoryID = @CategoryID,
	Description = @Description,
	UnitPrice = @UnitPrice,
	UnitsInStock = @UnitsInStock,
	SmallPhotoPath = @SmallPhotoPath,
	LargePhotoPath = @LargePhotoPath
Where ProductID = @ProductID
End
------------------------------------
Go
Create Proc pr_Products_Delete
(
	@ProductID int
)as
IF @ProductID is not null
Begin
Delete From Products
Where ProductID = @ProductID
End

--------------------------------------
Go
Create Procedure pr_ProductInCategory_List
(
	@CategoryID int 
)as
if(@CategoryID > 0)
Begin
Select * From Products P join Categories C
on P.CategoryID = C.CategoryID 
Where P.CategoryID = @CategoryID
End

---------------------------------------

Go
Create Procedure pr_SelectedProduct_List
(
	@ProductID int
)as
Begin
Select * From Products Where ProductID = @ProductID
End

---------------------------------
------------Brands---------------
Go
Create Procedure pr_Brands_List
as
Begin
Select * From Brands
End