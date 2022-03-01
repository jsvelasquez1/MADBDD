CREATE TABLE "Order_Fact" (
	"OrderFactId"	VARCHAR(8000) NOT NULL,
	"ProductId"	INTEGER NOT NULL,
	"CustomerId"	VARCHAR(8000),
	"EmployeeId"	INTEGER NOT NULL,
	"TimeId" INTEGER NOT NULL,
	"SupplierId"	INTEGER NOT NULL,
	"UnitPrice"	DECIMAL NOT NULL,
	"Quantity"	INTEGER NOT NULL,
	FOREIGN KEY("ProductId") REFERENCES "dim_product"("ProductId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY("CustomerId") REFERENCES "dim_customer"("CustomerId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY("EmployeeId") REFERENCES "dim_employee"("EmployeeId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY("TimeId") REFERENCES "dim_time"("TimeId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY("SupplierId") REFERENCES "dim_supplier"("SupplierId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY("OrderFactId")
);



CREATE TABLE "dim_customer" (
	"CustomerId"	VARCHAR(8000) NOT NULL,
	"CompanyName"	VARCHAR(8000),
	"ContactName"	VARCHAR(8000),
	"ContactTitle"	VARCHAR(8000),
	"Address"	VARCHAR(8000),
	"City"	VARCHAR(8000),
	"Region"	VARCHAR(8000),
	"PostalCode"	VARCHAR(8000),
	"Country"	VARCHAR(8000),
	"Phone"	VARCHAR(8000),
	"Fax"	VARCHAR(8000),
	PRIMARY KEY("CustomerId")
);

CREATE TABLE "dim_employee" (
	"EmployeeId"	INTEGER NOT NULL,
	"TerritoryId"	VARCHAR(8000),
	"LastName"	VARCHAR(8000),
	"FirstName"	VARCHAR(8000),
	"Title"	VARCHAR(8000),
	"TitleOfCourtesy"	VARCHAR(8000),
	"BirthDate"	VARCHAR(8000),
	"HireDate"	VARCHAR(8000),
	"Address"	VARCHAR(8000),
	"City"	VARCHAR(8000),
	"Region"	VARCHAR(8000),
	"PostalCode"	VARCHAR(8000),
	"Country"	VARCHAR(8000),
	"HomePhone"	VARCHAR(8000),
	FOREIGN KEY("TerritoryId") REFERENCES "dim_territory"("TerritoryId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY("EmployeeId" AUTOINCREMENT)
);

CREATE TABLE "dim_shipper" (
	"ShipperId"	INTEGER NOT NULL,
	"CompanyName"	VARCHAR(8000),
	"Phone"	VARCHAR(8000),
	PRIMARY KEY("ShipperId" AUTOINCREMENT)
);

CREATE TABLE "dim_time" (
	"TimeId" INTEGER NOT NULL,
	"date" DATE NOT NULL,
	"year" INTEGER NOT NULL,
	"month" INTEGER NOT NULL,
	"month_name" NVARCHAR(200) NOT NULL,
	"day" INTEGER NOT NULL,
	"day_name" NVARCHAR(200) NOT NULL,
	"day_week" INTEGER NOT NULL,
	"week" INTEGER NOT NULL,
	"quarter" INTEGER NOT NULL,
	PRIMARY KEY("TimeId" AUTOINCREMENT)
);

CREATE TABLE "dim_supplier" (
	"SupplierId"	INTEGER NOT NULL,
	"CompanyName"	VARCHAR(8000),
	"ContactName"	VARCHAR(8000),
	"ContactTitle"	VARCHAR(8000),
	"Address"	VARCHAR(8000),
	"City"	VARCHAR(8000),
	"Region"	VARCHAR(8000),
	"PostalCode"	VARCHAR(8000),
	"Country"	VARCHAR(8000),
	"Phone"	VARCHAR(8000),
	"Fax"	VARCHAR(8000),
	"HomePage"	VARCHAR(8000),
	PRIMARY KEY("SupplierId" AUTOINCREMENT)
);

CREATE TABLE "dim_category" (
	"CategoryId"	INTEGER NOT NULL,
	"CategoryName"	VARCHAR(8000),
	"Description"	VARCHAR(8000),
	PRIMARY KEY("CategoryId" AUTOINCREMENT)
);

CREATE TABLE "dim_product" (
	"ProductId"	INTEGER NOT NULL,
	"ProductName"	VARCHAR(8000),
	"CategoryId"	INTEGER NOT NULL,
	FOREIGN KEY("CategoryId") REFERENCES "dim_category"("CategoryId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY("ProductId" AUTOINCREMENT)
);

CREATE TABLE "dim_region" (
	"RegionId"	INTEGER NOT NULL,
	"RegionDescription"	VARCHAR(8000),
	PRIMARY KEY("RegionId" AUTOINCREMENT)
);

CREATE TABLE "dim_territory" (
	"TerritoryId"	VARCHAR(8000) NOT NULL,
	"TerritoryDescription"	VARCHAR(8000),
	"RegionId"	INTEGER NOT NULL,
	FOREIGN KEY("RegionId") REFERENCES "dim_region"("RegionId") ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY("TerritoryId")
);