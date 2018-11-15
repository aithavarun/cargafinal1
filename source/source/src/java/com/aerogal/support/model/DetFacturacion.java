/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Cesar
 */
public class DetFacturacion {

    public static DetFacturacion load(ResultSet rs) throws SQLException {
        DetFacturacion detFacturacion = new DetFacturacion();
        detFacturacion.setLine_Type(rs.getString(1));
        detFacturacion.setBath_Source(rs.getString(2));
        detFacturacion.setConversion_Date(rs.getString(3));
        detFacturacion.setConversion_Rate(rs.getInt(4));
        detFacturacion.setCreation_Date(rs.getString(5));
        detFacturacion.setCurrency_Code(rs.getString(6));
        detFacturacion.setTRX_Type(rs.getString(7));
        detFacturacion.setGl_Date(rs.getString(8));
        detFacturacion.setOrg_Id(rs.getInt(9));
        detFacturacion.setOrig_System_Address_Ref(rs.getString(10));
        detFacturacion.setSalesrep_num(rs.getInt(11));
        detFacturacion.setPrinting_Option(rs.getString(12));
        detFacturacion.setQuantity(rs.getInt(13));
        detFacturacion.setSet_Of_Books(rs.getInt(14));
        detFacturacion.setTax_Code(rs.getString(15));
        detFacturacion.setTRX_Date(rs.getString(16));
        detFacturacion.setTRX_Number(rs.getString(17));
        detFacturacion.setUnit_Selling_Price(rs.getFloat(18));
        detFacturacion.setUOM_Name(rs.getString(19));
        detFacturacion.setDescription(rs.getString(20));
        detFacturacion.setAmount(rs.getFloat(21));
        detFacturacion.setTerm_Name(rs.getString(22));
        detFacturacion.setOrig_System_Ref(rs.getString(23));
        detFacturacion.setInterface_Line_Attrib11(rs.getString(24));
        detFacturacion.setLink_To_Line_Attribute1(rs.getString(25));
        detFacturacion.setTax_Rate(rs.getInt(26));
        detFacturacion.setConversion_Type(rs.getString(27));
        detFacturacion.setMemo_line(rs.getString(28));
        detFacturacion.setENVIAACIENTE(rs.getString(29));
        detFacturacion.setFACTDIGITALIZADA(rs.getString(30));
        detFacturacion.setLLEVASOPORTE(rs.getString(31));
        detFacturacion.setZEROOCTA(rs.getString(32));
        detFacturacion.setTIPO_FACTURACION(rs.getString(33));
        detFacturacion.setTc(rs.getString(34));
        return detFacturacion;
    }

    private String Line_Type;
    private String Bath_Source;
    private String Conversion_Date;
    private int Conversion_Rate;
    private String Creation_Date;
    private String Currency_Code;
    private String TRX_Type;
    private String Gl_Date;
    private int Org_Id;
    private String Orig_System_Address_Ref;
    private int Salesrep_num;
    private String Printing_Option;
    private int Quantity;
    private int Set_Of_Books;
    private String Tax_Code;
    private String TRX_Date;
    private String TRX_Number;
    private float Unit_Selling_Price;
    private String UOM_Name;
    private String Description;
    private float Amount;
    private String Term_Name;
    private String Orig_System_Ref;
    private String Interface_Line_Attrib11;
    private String Link_To_Line_Attribute1;
    private int Tax_Rate;
    private String Conversion_Type;
    private String Memo_line;
    private String ENVIAACIENTE;
    private String FACTDIGITALIZADA;
    private String LLEVASOPORTE;
    private String ZEROOCTA;
    private String TIPO_FACTURACION;
    private String Tc;

    public String getLine_Type() {
        return Line_Type;
    }

    public void setLine_Type(String Line_Type) {
        this.Line_Type = Line_Type;
    }

    public String getBath_Source() {
        return Bath_Source;
    }

    public void setBath_Source(String Bath_Source) {
        this.Bath_Source = Bath_Source;
    }

    public String getConversion_Date() {
        return Conversion_Date;
    }

    public void setConversion_Date(String Conversion_Date) {
        this.Conversion_Date = Conversion_Date;
    }

    public int getConversion_Rate() {
        return Conversion_Rate;
    }

    public void setConversion_Rate(int Conversion_Rate) {
        this.Conversion_Rate = Conversion_Rate;
    }

    public String getCreation_Date() {
        return Creation_Date;
    }

    public void setCreation_Date(String Creation_Date) {
        this.Creation_Date = Creation_Date;
    }

    public String getCurrency_Code() {
        return Currency_Code;
    }

    public void setCurrency_Code(String Currency_Code) {
        this.Currency_Code = Currency_Code;
    }

    public String getTRX_Type() {
        return TRX_Type;
    }

    public void setTRX_Type(String TRX_Type) {
        this.TRX_Type = TRX_Type;
    }

    public String getGl_Date() {
        return Gl_Date;
    }

    public void setGl_Date(String Gl_Date) {
        this.Gl_Date = Gl_Date;
    }

    public int getOrg_Id() {
        return Org_Id;
    }

    public void setOrg_Id(int Org_Id) {
        this.Org_Id = Org_Id;
    }

    public String getOrig_System_Address_Ref() {
        return Orig_System_Address_Ref;
    }

    public void setOrig_System_Address_Ref(String Orig_System_Address_Ref) {
        this.Orig_System_Address_Ref = Orig_System_Address_Ref;
    }

    public int getSalesrep_num() {
        return Salesrep_num;
    }

    public void setSalesrep_num(int Salesrep_num) {
        this.Salesrep_num = Salesrep_num;
    }

    public String getPrinting_Option() {
        return Printing_Option;
    }

    public void setPrinting_Option(String Printing_Option) {
        this.Printing_Option = Printing_Option;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getSet_Of_Books() {
        return Set_Of_Books;
    }

    public void setSet_Of_Books(int Set_Of_Books) {
        this.Set_Of_Books = Set_Of_Books;
    }

    public String getTax_Code() {
        return Tax_Code;
    }

    public void setTax_Code(String Tax_Code) {
        this.Tax_Code = Tax_Code;
    }

    public String getTRX_Date() {
        return TRX_Date;
    }

    public void setTRX_Date(String TRX_Date) {
        this.TRX_Date = TRX_Date;
    }

    public String getTRX_Number() {
        return TRX_Number;
    }

    public void setTRX_Number(String TRX_Number) {
        this.TRX_Number = TRX_Number;
    }

    public float getUnit_Selling_Price() {
        return Unit_Selling_Price;
    }

    public void setUnit_Selling_Price(float Unit_Selling_Price) {
        this.Unit_Selling_Price = Unit_Selling_Price;
    }

    public String getUOM_Name() {
        return UOM_Name;
    }

    public void setUOM_Name(String UOM_Name) {
        this.UOM_Name = UOM_Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float Amount) {
        this.Amount = Amount;
    }

    public String getTerm_Name() {
        return Term_Name;
    }

    public void setTerm_Name(String Term_Name) {
        this.Term_Name = Term_Name;
    }

    public String getENVIAACIENTE() {
        return ENVIAACIENTE;
    }

    public void setENVIAACIENTE(String ENVIAACIENTE) {
        this.ENVIAACIENTE = ENVIAACIENTE;
    }

    public String getFACTDIGITALIZADA() {
        return FACTDIGITALIZADA;
    }

    public void setFACTDIGITALIZADA(String FACTDIGITALIZADA) {
        this.FACTDIGITALIZADA = FACTDIGITALIZADA;
    }

    public String getLLEVASOPORTE() {
        return LLEVASOPORTE;
    }

    public void setLLEVASOPORTE(String LLEVASOPORTE) {
        this.LLEVASOPORTE = LLEVASOPORTE;
    }

    public String getZEROOCTA() {
        return ZEROOCTA;
    }

    public void setZEROOCTA(String ZEROOCTA) {
        this.ZEROOCTA = ZEROOCTA;
    }

    public String getTIPO_FACTURACION() {
        return TIPO_FACTURACION;
    }

    public void setTIPO_FACTURACION(String TIPO_FACTURACION) {
        this.TIPO_FACTURACION = TIPO_FACTURACION;
    }

    public String getOrig_System_Ref() {
        return Orig_System_Ref;
    }

    public void setOrig_System_Ref(String Orig_System_Ref) {
        this.Orig_System_Ref = Orig_System_Ref;
    }

    public String getInterface_Line_Attrib11() {
        return Interface_Line_Attrib11;
    }

    public void setInterface_Line_Attrib11(String Interface_Line_Attrib11) {
        this.Interface_Line_Attrib11 = Interface_Line_Attrib11;
    }

    public String getLink_To_Line_Attribute1() {
        return Link_To_Line_Attribute1;
    }

    public void setLink_To_Line_Attribute1(String Link_To_Line_Attribute1) {
        this.Link_To_Line_Attribute1 = Link_To_Line_Attribute1;
    }

    public int getTax_Rate() {
        return Tax_Rate;
    }

    public void setTax_Rate(int Tax_Rate) {
        this.Tax_Rate = Tax_Rate;
    }

    public String getConversion_Type() {
        return Conversion_Type;
    }

    public void setConversion_Type(String Conversion_Type) {
        this.Conversion_Type = Conversion_Type;
    }

    public String getMemo_line() {
        return Memo_line;
    }

    public void setMemo_line(String Memo_line) {
        this.Memo_line = Memo_line;
    }

    public String getTc() {
        return Tc;
    }

    public void setTc(String Tc) {
        this.Tc = Tc;
    }

}
