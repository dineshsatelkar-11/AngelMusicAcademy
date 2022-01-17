/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Admin
 */
@Entity
public class AdminPrevilleages implements java.io.Serializable {

    @Id
    @GeneratedValue
    private int Id;
    private String admintype;
    @OneToOne(fetch = FetchType.EAGER)
    private Admin Admin;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean adminIndex = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean branchReceptionIndex = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllAccounts = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllStudent = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean LossReport = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllRentRequest = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllRepairing = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllEmployee = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean DailyInOut = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllEnquiry = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllUploadPdf = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean PreviousStudentReport = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AllSuperAdminExternal = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminDailyInOut = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminInOutBranch = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminInOutVendor = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminEmployee = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminClient = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Add_Details = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean addBranch = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean addCourse = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean addInstrument = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean InstrumentRepair = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean EmployeeRegistr = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean PreviousStudent_1 = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean UploadCoursePdf = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AssignPDFtoAdmin = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SuperAdminPayment = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean ExternalAccount = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Sell_Details = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Category = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Sub_Category = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Model_No = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Brand = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Color = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Product = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Vendor = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Purchase_Order = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Sell_to_Branch = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Sell_to_Class = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Sell_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Debit_Vendor = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Vendor_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Purchase_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Branch_Sell_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Class_Branch_Sell_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Customer_Sell_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean All_Product_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Available_Product = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Branch_Product_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Class_Product_Stock_Report = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Batch_Timing = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Package = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Vendor_Account = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean SMS = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Send_Promotional_SMS = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Branch_Sell_Report_Super = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Class_Branch_Sell_Report_Super = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Customer_Sell_Report_Super = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Branch_Product_Report_Super = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean AvailableBranchProduct_Super = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Time_Table = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Expense = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Enquiry = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean EnquiryReport = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean PayemtReport = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean New_Account = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Balance = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Vanished = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean previliageTab = false;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean activePackage = false;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean rentCostReport = false;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean repairCostReport = false;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean sellCostReport = false;

    public boolean isAdminIndex() {
        return adminIndex;
    }

    public void setAdminIndex(boolean adminIndex) {
        this.adminIndex = adminIndex;
    }

    public boolean isBranchReceptionIndex() {
        return branchReceptionIndex;
    }

    public void setBranchReceptionIndex(boolean branchReceptionIndex) {
        this.branchReceptionIndex = branchReceptionIndex;
    }

    public boolean isVanished() {
        return Vanished;
    }

    public void setVanished(boolean Vanished) {
        this.Vanished = Vanished;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Admin getAdmin() {
        return Admin;
    }

    public void setAdmin(Admin Admin) {
        this.Admin = Admin;
    }

    public boolean isReport() {
        return Report;
    }

    public void setReport(boolean Report) {
        this.Report = Report;
    }

    public boolean isAllAccounts() {
        return AllAccounts;
    }

    public void setAllAccounts(boolean AllAccounts) {
        this.AllAccounts = AllAccounts;
    }

    public boolean isAllStudent() {
        return AllStudent;
    }

    public void setAllStudent(boolean AllStudent) {
        this.AllStudent = AllStudent;
    }

    public boolean isLossReport() {
        return LossReport;
    }

    public void setLossReport(boolean LossReport) {
        this.LossReport = LossReport;
    }

    public boolean isAllRentRequest() {
        return AllRentRequest;
    }

    public void setAllRentRequest(boolean AllRentRequest) {
        this.AllRentRequest = AllRentRequest;
    }

    public boolean isAllRepairing() {
        return AllRepairing;
    }

    public void setAllRepairing(boolean AllRepairing) {
        this.AllRepairing = AllRepairing;
    }

    public boolean isAllEmployee() {
        return AllEmployee;
    }

    public void setAllEmployee(boolean AllEmployee) {
        this.AllEmployee = AllEmployee;
    }

    public boolean isDailyInOut() {
        return DailyInOut;
    }

    public void setDailyInOut(boolean DailyInOut) {
        this.DailyInOut = DailyInOut;
    }

    public boolean isAllEnquiry() {
        return AllEnquiry;
    }

    public void setAllEnquiry(boolean AllEnquiry) {
        this.AllEnquiry = AllEnquiry;
    }

    public boolean isAllUploadPdf() {
        return AllUploadPdf;
    }

    public void setAllUploadPdf(boolean AllUploadPdf) {
        this.AllUploadPdf = AllUploadPdf;
    }

    public boolean isPreviousStudentReport() {
        return PreviousStudentReport;
    }

    public void setPreviousStudentReport(boolean PreviousStudentReport) {
        this.PreviousStudentReport = PreviousStudentReport;
    }

    public boolean isAllSuperAdminExternal() {
        return AllSuperAdminExternal;
    }

    public void setAllSuperAdminExternal(boolean AllSuperAdminExternal) {
        this.AllSuperAdminExternal = AllSuperAdminExternal;
    }

    public boolean isSuperAdminDailyInOut() {
        return SuperAdminDailyInOut;
    }

    public void setSuperAdminDailyInOut(boolean SuperAdminDailyInOut) {
        this.SuperAdminDailyInOut = SuperAdminDailyInOut;
    }

    public boolean isSuperAdminInOutBranch() {
        return SuperAdminInOutBranch;
    }

    public void setSuperAdminInOutBranch(boolean SuperAdminInOutBranch) {
        this.SuperAdminInOutBranch = SuperAdminInOutBranch;
    }

    public boolean isSuperAdminInOutVendor() {
        return SuperAdminInOutVendor;
    }

    public void setSuperAdminInOutVendor(boolean SuperAdminInOutVendor) {
        this.SuperAdminInOutVendor = SuperAdminInOutVendor;
    }

    public boolean isSuperAdminEmployee() {
        return SuperAdminEmployee;
    }

    public void setSuperAdminEmployee(boolean SuperAdminEmployee) {
        this.SuperAdminEmployee = SuperAdminEmployee;
    }

    public boolean isSuperAdminClient() {
        return SuperAdminClient;
    }

    public void setSuperAdminClient(boolean SuperAdminClient) {
        this.SuperAdminClient = SuperAdminClient;
    }

    public boolean isAdd_Details() {
        return Add_Details;
    }

    public void setAdd_Details(boolean Add_Details) {
        this.Add_Details = Add_Details;
    }

    public boolean isAddBranch() {
        return addBranch;
    }

    public void setAddBranch(boolean addBranch) {
        this.addBranch = addBranch;
    }

    public boolean isAddCourse() {
        return addCourse;
    }

    public void setAddCourse(boolean addCourse) {
        this.addCourse = addCourse;
    }

    public boolean isAddInstrument() {
        return addInstrument;
    }

    public void setAddInstrument(boolean addInstrument) {
        this.addInstrument = addInstrument;
    }

    public boolean isInstrumentRepair() {
        return InstrumentRepair;
    }

    public void setInstrumentRepair(boolean InstrumentRepair) {
        this.InstrumentRepair = InstrumentRepair;
    }

    public boolean isEmployeeRegistr() {
        return EmployeeRegistr;
    }

    public void setEmployeeRegistr(boolean EmployeeRegistr) {
        this.EmployeeRegistr = EmployeeRegistr;
    }

    public boolean isPreviousStudent_1() {
        return PreviousStudent_1;
    }

    public void setPreviousStudent_1(boolean PreviousStudent_1) {
        this.PreviousStudent_1 = PreviousStudent_1;
    }

    public boolean isUploadCoursePdf() {
        return UploadCoursePdf;
    }

    public void setUploadCoursePdf(boolean UploadCoursePdf) {
        this.UploadCoursePdf = UploadCoursePdf;
    }

    public boolean isAssignPDFtoAdmin() {
        return AssignPDFtoAdmin;
    }

    public void setAssignPDFtoAdmin(boolean AssignPDFtoAdmin) {
        this.AssignPDFtoAdmin = AssignPDFtoAdmin;
    }

    public boolean isSuperAdminPayment() {
        return SuperAdminPayment;
    }

    public void setSuperAdminPayment(boolean SuperAdminPayment) {
        this.SuperAdminPayment = SuperAdminPayment;
    }

    public boolean isExternalAccount() {
        return ExternalAccount;
    }

    public void setExternalAccount(boolean ExternalAccount) {
        this.ExternalAccount = ExternalAccount;
    }

    public boolean isSell_Details() {
        return Sell_Details;
    }

    public void setSell_Details(boolean Sell_Details) {
        this.Sell_Details = Sell_Details;
    }

    public boolean isCategory() {
        return Category;
    }

    public void setCategory(boolean Category) {
        this.Category = Category;
    }

    public boolean isSub_Category() {
        return Sub_Category;
    }

    public void setSub_Category(boolean Sub_Category) {
        this.Sub_Category = Sub_Category;
    }

    public boolean isModel_No() {
        return Model_No;
    }

    public void setModel_No(boolean Model_No) {
        this.Model_No = Model_No;
    }

    public boolean isBrand() {
        return Brand;
    }

    public void setBrand(boolean Brand) {
        this.Brand = Brand;
    }

    public boolean isColor() {
        return Color;
    }

    public void setColor(boolean Color) {
        this.Color = Color;
    }

    public boolean isProduct() {
        return Product;
    }

    public void setProduct(boolean Product) {
        this.Product = Product;
    }

    public boolean isVendor() {
        return Vendor;
    }

    public void setVendor(boolean Vendor) {
        this.Vendor = Vendor;
    }

    public boolean isPurchase_Order() {
        return Purchase_Order;
    }

    public void setPurchase_Order(boolean Purchase_Order) {
        this.Purchase_Order = Purchase_Order;
    }

    public boolean isSell_to_Branch() {
        return Sell_to_Branch;
    }

    public void setSell_to_Branch(boolean Sell_to_Branch) {
        this.Sell_to_Branch = Sell_to_Branch;
    }

    public boolean isSell_to_Class() {
        return Sell_to_Class;
    }

    public void setSell_to_Class(boolean Sell_to_Class) {
        this.Sell_to_Class = Sell_to_Class;
    }

    public boolean isSell_Report() {
        return Sell_Report;
    }

    public void setSell_Report(boolean Sell_Report) {
        this.Sell_Report = Sell_Report;
    }

    public boolean isDebit_Vendor() {
        return Debit_Vendor;
    }

    public void setDebit_Vendor(boolean Debit_Vendor) {
        this.Debit_Vendor = Debit_Vendor;
    }

    public boolean isVendor_Report() {
        return Vendor_Report;
    }

    public void setVendor_Report(boolean Vendor_Report) {
        this.Vendor_Report = Vendor_Report;
    }

    public boolean isPurchase_Report() {
        return Purchase_Report;
    }

    public void setPurchase_Report(boolean Purchase_Report) {
        this.Purchase_Report = Purchase_Report;
    }

    public boolean isBranch_Sell_Report() {
        return Branch_Sell_Report;
    }

    public void setBranch_Sell_Report(boolean Branch_Sell_Report) {
        this.Branch_Sell_Report = Branch_Sell_Report;
    }

    public boolean isClass_Branch_Sell_Report() {
        return Class_Branch_Sell_Report;
    }

    public void setClass_Branch_Sell_Report(boolean Class_Branch_Sell_Report) {
        this.Class_Branch_Sell_Report = Class_Branch_Sell_Report;
    }

    public boolean isCustomer_Sell_Report() {
        return Customer_Sell_Report;
    }

    public void setCustomer_Sell_Report(boolean Customer_Sell_Report) {
        this.Customer_Sell_Report = Customer_Sell_Report;
    }

    public boolean isAll_Product_Report() {
        return All_Product_Report;
    }

    public void setAll_Product_Report(boolean All_Product_Report) {
        this.All_Product_Report = All_Product_Report;
    }

    public boolean isAvailable_Product() {
        return Available_Product;
    }

    public void setAvailable_Product(boolean Available_Product) {
        this.Available_Product = Available_Product;
    }

    public boolean isBranch_Product_Report() {
        return Branch_Product_Report;
    }

    public void setBranch_Product_Report(boolean Branch_Product_Report) {
        this.Branch_Product_Report = Branch_Product_Report;
    }

    public boolean isClass_Product_Stock_Report() {
        return Class_Product_Stock_Report;
    }

    public void setClass_Product_Stock_Report(boolean Class_Product_Stock_Report) {
        this.Class_Product_Stock_Report = Class_Product_Stock_Report;
    }

    public boolean isBatch_Timing() {
        return Batch_Timing;
    }

    public void setBatch_Timing(boolean Batch_Timing) {
        this.Batch_Timing = Batch_Timing;
    }

    public boolean isPackage() {
        return Package;
    }

    public void setPackage(boolean Package) {
        this.Package = Package;
    }

    public boolean isPayemtReport() {
        return PayemtReport;
    }

    public void setPayemtReport(boolean PayemtReport) {
        this.PayemtReport = PayemtReport;
    }

    public boolean isVendor_Account() {
        return Vendor_Account;
    }

    public void setVendor_Account(boolean Vendor_Account) {
        this.Vendor_Account = Vendor_Account;
    }

    public boolean isSMS() {
        return SMS;
    }

    public void setSMS(boolean SMS) {
        this.SMS = SMS;
    }

    public boolean isSend_Promotional_SMS() {
        return Send_Promotional_SMS;
    }

    public void setSend_Promotional_SMS(boolean Send_Promotional_SMS) {
        this.Send_Promotional_SMS = Send_Promotional_SMS;
    }

    public boolean isBranch_Sell_Report_Super() {
        return Branch_Sell_Report_Super;
    }

    public void setBranch_Sell_Report_Super(boolean Branch_Sell_Report_Super) {
        this.Branch_Sell_Report_Super = Branch_Sell_Report_Super;
    }

    public boolean isClass_Branch_Sell_Report_Super() {
        return Class_Branch_Sell_Report_Super;
    }

    public void setClass_Branch_Sell_Report_Super(boolean Class_Branch_Sell_Report_Super) {
        this.Class_Branch_Sell_Report_Super = Class_Branch_Sell_Report_Super;
    }

    public boolean isCustomer_Sell_Report_Super() {
        return Customer_Sell_Report_Super;
    }

    public void setCustomer_Sell_Report_Super(boolean Customer_Sell_Report_Super) {
        this.Customer_Sell_Report_Super = Customer_Sell_Report_Super;
    }

    public boolean isBranch_Product_Report_Super() {
        return Branch_Product_Report_Super;
    }

    public void setBranch_Product_Report_Super(boolean Branch_Product_Report_Super) {
        this.Branch_Product_Report_Super = Branch_Product_Report_Super;
    }

    public boolean isAvailableBranchProduct_Super() {
        return AvailableBranchProduct_Super;
    }

    public void setAvailableBranchProduct_Super(boolean AvailableBranchProduct_Super) {
        this.AvailableBranchProduct_Super = AvailableBranchProduct_Super;
    }

    public boolean isTime_Table() {
        return Time_Table;
    }

    public void setTime_Table(boolean Time_Table) {
        this.Time_Table = Time_Table;
    }

    public boolean isExpense() {
        return Expense;
    }

    public void setExpense(boolean Expense) {
        this.Expense = Expense;
    }

    public boolean isEnquiry() {
        return Enquiry;
    }

    public void setEnquiry(boolean Enquiry) {
        this.Enquiry = Enquiry;
    }

    public boolean isNew_Account() {
        return New_Account;
    }

    public void setNew_Account(boolean New_Account) {
        this.New_Account = New_Account;
    }

    public boolean isBalance() {
        return Balance;
    }

    public void setBalance(boolean Balance) {
        this.Balance = Balance;
    }

    public String getAdmintype() {
        return admintype;
    }

    public void setAdmintype(String admintype) {
        this.admintype = admintype;
    }

    public boolean isEnquiryReport() {
        return EnquiryReport;
    }

    public void setEnquiryReport(boolean EnquiryReport) {
        this.EnquiryReport = EnquiryReport;
    }

    public boolean isPreviliageTab() {
        return previliageTab;
    }

    public void setPreviliageTab(boolean previliageTab) {
        this.previliageTab = previliageTab;
    }

  

    public boolean isRentCostReport() {
        return rentCostReport;
    }

    public void setRentCostReport(boolean rentCostReport) {
        this.rentCostReport = rentCostReport;
    }

    public boolean isRepairCostReport() {
        return repairCostReport;
    }

    public void setRepairCostReport(boolean repairCostReport) {
        this.repairCostReport = repairCostReport;
    }

    public boolean isSellCostReport() {
        return sellCostReport;
    }

    public void setSellCostReport(boolean sellCostReport) {
        this.sellCostReport = sellCostReport;
    }

    public boolean isActivePackage() {
        return activePackage;
    }

    public void setActivePackage(boolean activePackage) {
        this.activePackage = activePackage;
    }

}
