#!/usr/bin/powershell
$hostname="localhost"
 $ref_tables = @("Application.People", 
            "Application.Countries", 
            "Application.StateProvinces", 
            "Application.Cities", 
            "Application.DeliveryMethods", 
            "Application.PaymentMethods", 
            "Application.TransactionTypes", 
            "Purchasing.SupplierCategories",
            "Purchasing.Suppliers",
            "Sales.BuyingGroups",
            "Sales.CustomerCategories",
            "Warehouse.Colors",
            "Warehouse.PackageTypes",
            "Warehouse.StockItems")

 foreach ($ref_table in $ref_tables) {
    $bcp_file = "./out/" + $ref_table + ".bcp"
    $fmt_file = "./out/"+ $ref_table + ".fmt"
    bcp $ref_table format nul -w -f $fmt_file -S $hostname -Uscripter -PYukon900 -d WideWorldImporters
    write-host "**** bcp out: " + $ref_table -foreground cyan
    bcp $ref_table out ./$bcp_file -f $fmt_file -S $hostname -Uscripter -PYukon900 -d WideWorldImporters
 }
